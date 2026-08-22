-- Migration 019 : ajout colonne icon_dark pour les icônes de liens adaptées au thème sombre
ALTER TABLE `links` ADD COLUMN `icon_dark` VARCHAR(255) DEFAULT NULL AFTER `icon`;
