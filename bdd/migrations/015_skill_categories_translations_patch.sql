-- 015 — Patch traductions name_fr / name_en des catégories de skills
-- Les colonnes ont été créées avec la valeur du key (anglais) — ce patch applique les vrais libellés.

UPDATE `skill_categories` SET
  `name_fr` = 'Front-End',
  `name_en` = 'Front-End'
WHERE `key` = 'Front-End';

UPDATE `skill_categories` SET
  `name_fr` = 'Back-End',
  `name_en` = 'Back-End'
WHERE `key` = 'Back-End';

UPDATE `skill_categories` SET
  `name_fr` = 'Langages',
  `name_en` = 'Languages'
WHERE `key` = 'Languages';

UPDATE `skill_categories` SET
  `name_fr` = 'Base de données',
  `name_en` = 'Databases'
WHERE `key` = 'BDD';

UPDATE `skill_categories` SET
  `name_fr` = 'Infrastructure',
  `name_en` = 'Infrastructure'
WHERE `key` = 'Infrastructure';

UPDATE `skill_categories` SET
  `name_fr` = 'Réseau',
  `name_en` = 'Networking'
WHERE `key` = 'Networking';

UPDATE `skill_categories` SET
  `name_fr` = 'Cloud',
  `name_en` = 'Cloud'
WHERE `key` = 'Cloud provider';

UPDATE `skill_categories` SET
  `name_fr` = 'DevSecOps',
  `name_en` = 'DevSecOps'
WHERE `key` = 'DevSecOps';

UPDATE `skill_categories` SET
  `name_fr` = 'Outillage',
  `name_en` = 'Tooling'
WHERE `key` = 'Tooling';

UPDATE `skill_categories` SET
  `name_fr` = 'Cryptographie',
  `name_en` = 'Cryptography'
WHERE `key` = 'Cryptography';

UPDATE `skill_categories` SET
  `name_fr` = 'Stratégie cyber',
  `name_en` = 'Cyber Strategy'
WHERE `key` = 'Cyber Strategy';

UPDATE `skill_categories` SET
  `name_fr` = 'Gouvernance',
  `name_en` = 'Governance'
WHERE `key` = 'Governance';

UPDATE `skill_categories` SET
  `name_fr` = 'Politique SI',
  `name_en` = 'IT Policy'
WHERE `key` = 'Policy';

UPDATE `skill_categories` SET
  `name_fr` = 'API',
  `name_en` = 'API'
WHERE `key` = 'API';

UPDATE `skill_categories` SET
  `name_fr` = 'Bonnes pratiques',
  `name_en` = 'Best Practices'
WHERE `key` = 'Best practice';

UPDATE `skill_categories` SET
  `name_fr` = 'Système',
  `name_en` = 'System'
WHERE `key` = 'System';
