-- Migration 012 : agrandir links.icon VARCHAR(100) → VARCHAR(255)
-- Permet de stocker des URLs d'images en plus des emojis/caractères courts.
ALTER TABLE `links` MODIFY `icon` VARCHAR(255);
