-- Migration 011 : projects.category → ENUM canonique anglais
-- Aligne la colonne sur le pattern experiences.type (migration 008).
-- category n'est pas traduisible : suppression de project_translations.category.

-- 1. Convertir projects.category en ENUM strict
ALTER TABLE `projects`
    MODIFY `category` ENUM('web','opensource','side') NULL;

-- 2. Supprimer la colonne category de project_translations (non traduisible)
ALTER TABLE `project_translations`
    DROP COLUMN `category`;
