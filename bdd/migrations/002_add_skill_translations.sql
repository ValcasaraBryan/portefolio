-- Migration 002 : table de traductions normalisée pour les skills
-- Option B : skill_translations(skill_id, locale, name, category)

CREATE TABLE IF NOT EXISTS `skill_translations` (
    `id`       INT PRIMARY KEY AUTO_INCREMENT,
    `skill_id` INT NOT NULL,
    `locale`   VARCHAR(5) NOT NULL,
    `name`     VARCHAR(100) NOT NULL,
    `category` VARCHAR(100) NOT NULL,
    UNIQUE KEY `uq_skill_locale` (`skill_id`, `locale`),
    FOREIGN KEY (`skill_id`) REFERENCES `skills`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Migrer les données existantes comme traductions EN
-- (les noms et catégories dans skills sont en anglais, sauf DNS dont la catégorie est 'Réseaux')
INSERT IGNORE INTO `skill_translations` (`skill_id`, `locale`, `name`, `category`)
SELECT `id`, 'en', `name`, `category` FROM `skills`;

-- Corriger la catégorie EN de DNS (canonique en FR 'Réseaux' → EN 'Networking')
UPDATE `skill_translations`
SET `category` = 'Networking'
WHERE `locale` = 'en'
  AND `skill_id` = (SELECT `id` FROM `skills` WHERE `name` = 'DNS');
