-- Migration 008 : experiences.type → ENUM canonique EN
-- Appliqué le : 2026-05-24
-- Objectif : remplacer le VARCHAR(50) libre par un ENUM à clés anglaises stables.
--
-- Source de vérité pour le mapping : la colonne `type` de experience_translations
-- locale='fr', qui contient les labels FR les plus fiables.
-- En cas d'absence de traduction FR, on se rabat sur la valeur de la table principale.

-- ─────────────────────────────────────────────────────────────────
-- Étape 1 : normaliser experiences.type → clé enum
--           Priorité : traduction FR → table principale
-- ─────────────────────────────────────────────────────────────────

-- 1a. Entrées qui ont une traduction FR : on lit le label FR pour déduire la clé
UPDATE `experiences` e
JOIN `experience_translations` et ON et.experience_id = e.id AND et.locale = 'fr'
SET e.`type` = CASE et.`type`
    WHEN 'Alternance'  THEN 'work_study'
    WHEN 'Indépendant' THEN 'self_employed'
    WHEN 'CDI'         THEN 'permanent_contract'
    WHEN 'CDD'         THEN 'fixed_term_contract'
    WHEN 'Stage'       THEN 'internship'
    WHEN 'Freelance'   THEN 'freelance'
    ELSE e.`type`   -- valeur non reconnue : on garde pour la correction manuelle ci-dessous
END;

-- 1b. Entrées sans traduction FR (ou valeur encore non résolue) :
--     normaliser depuis la table principale (labels EN ou FR ou déjà clés)
UPDATE `experiences` SET `type` = 'work_study'          WHERE `type` IN ('Work-study', 'Alternance');
UPDATE `experiences` SET `type` = 'self_employed'       WHERE `type` IN ('Self-employed', 'Indépendant');
UPDATE `experiences` SET `type` = 'permanent_contract'  WHERE `type` IN ('Permanent contract', 'CDI');
UPDATE `experiences` SET `type` = 'fixed_term_contract' WHERE `type` IN ('Fixed-term contract', 'CDD');
UPDATE `experiences` SET `type` = 'internship'          WHERE `type` IN ('Internship', 'Stage');
UPDATE `experiences` SET `type` = 'freelance'           WHERE `type` IN ('Freelance', 'freelance');

-- 1c. Mettre NULL toute valeur encore non reconnue (évite l'échec de l'ALTER)
UPDATE `experiences`
SET `type` = NULL
WHERE `type` IS NOT NULL
  AND `type` NOT IN ('internship','permanent_contract','fixed_term_contract',
                     'work_study','freelance','self_employed');

-- ─────────────────────────────────────────────────────────────────
-- Étape 2 : modifier la colonne en ENUM
-- ─────────────────────────────────────────────────────────────────
ALTER TABLE `experiences`
  MODIFY COLUMN `type`
    ENUM('internship','permanent_contract','fixed_term_contract',
         'work_study','freelance','self_employed') NULL;

-- ─────────────────────────────────────────────────────────────────
-- Étape 3 : synchroniser les labels EN dans experience_translations
-- ─────────────────────────────────────────────────────────────────
INSERT INTO `experience_translations` (`experience_id`, `locale`, `role`, `type`, `description`)
SELECT
    e.id,
    'en',
    COALESCE(et.role, e.role),
    CASE e.`type`
        WHEN 'internship'          THEN 'Internship'
        WHEN 'permanent_contract'  THEN 'Permanent contract'
        WHEN 'fixed_term_contract' THEN 'Fixed-term contract'
        WHEN 'work_study'          THEN 'Work-study'
        WHEN 'freelance'           THEN 'Freelance'
        WHEN 'self_employed'       THEN 'Self-employed'
        ELSE NULL
    END,
    COALESCE(et.description, e.description)
FROM `experiences` e
LEFT JOIN `experience_translations` et ON et.experience_id = e.id AND et.locale = 'en'
ON DUPLICATE KEY UPDATE
    `type` = VALUES(`type`);

-- ─────────────────────────────────────────────────────────────────
-- Étape 4 : synchroniser les labels FR dans experience_translations
-- ─────────────────────────────────────────────────────────────────
INSERT INTO `experience_translations` (`experience_id`, `locale`, `role`, `type`, `description`)
SELECT
    e.id,
    'fr',
    COALESCE(et.role, e.role),
    CASE e.`type`
        WHEN 'internship'          THEN 'Stage'
        WHEN 'permanent_contract'  THEN 'CDI'
        WHEN 'fixed_term_contract' THEN 'CDD'
        WHEN 'work_study'          THEN 'Alternance'
        WHEN 'freelance'           THEN 'Freelance'
        WHEN 'self_employed'       THEN 'Indépendant'
        ELSE NULL
    END,
    COALESCE(et.description, e.description)
FROM `experiences` e
LEFT JOIN `experience_translations` et ON et.experience_id = e.id AND et.locale = 'fr'
ON DUPLICATE KEY UPDATE
    `type` = VALUES(`type`);
