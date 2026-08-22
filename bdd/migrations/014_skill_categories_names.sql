-- 018 — skill_categories : noms traduits (name_fr / name_en)
-- Ajoute les colonnes de libellé traduisible, initialisées depuis key

ALTER TABLE `skill_categories`
  ADD COLUMN `name_fr` VARCHAR(100) NOT NULL DEFAULT '' AFTER `key`,
  ADD COLUMN `name_en` VARCHAR(100) NOT NULL DEFAULT '' AFTER `name_fr`;

-- Seed initial : name_fr = name_en = key pour les catégories existantes
UPDATE `skill_categories` SET `name_fr` = `key`, `name_en` = `key`;
