-- Migration 009 : Ajout du champ bio sur le profil (bilingue)

-- Ajouter le champ bio à la table principale (valeur FR par défaut)
ALTER TABLE `profile`
  ADD COLUMN `bio` TEXT DEFAULT NULL AFTER `status`;

-- Ajouter bio dans la table de traductions
ALTER TABLE `profile_translations`
  ADD COLUMN `bio` TEXT DEFAULT NULL;
