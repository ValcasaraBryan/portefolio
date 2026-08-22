-- Migration 007 : remap project categories to match frontend filter values
-- web  · opensource  · side
-- ─────────────────────────────────────────────────────────────────────

-- Base table
UPDATE `projects` SET `category` = 'side' WHERE `category` = 'Personal';
UPDATE `projects` SET `category` = 'web'  WHERE `category` = 'Self-employed';
UPDATE `projects` SET `category` = 'web'  WHERE `category` = 'Enterprise';

-- Translations EN
UPDATE `project_translations` SET `category` = 'side' WHERE `category` = 'Personal';
UPDATE `project_translations` SET `category` = 'web'  WHERE `category` = 'Self-employed';
UPDATE `project_translations` SET `category` = 'web'  WHERE `category` = 'Enterprise';

-- Translations FR
UPDATE `project_translations` SET `category` = 'side' WHERE `category` = 'Personnel';
UPDATE `project_translations` SET `category` = 'web'  WHERE `category` = 'Indépendant';
UPDATE `project_translations` SET `category` = 'web'  WHERE `category` = 'Entreprise';

-- Base table : cas où les données FR ont été saisies directement (dump / admin)
UPDATE `projects` SET `category` = 'side' WHERE `category` = 'Personnel';
UPDATE `projects` SET `category` = 'web'  WHERE `category` = 'Indépendant';
UPDATE `projects` SET `category` = 'web'  WHERE `category` = 'Entreprise';
