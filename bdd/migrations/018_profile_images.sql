-- 018 — Nouvelles images de profil : photo page À propos, bannière, toggle source
ALTER TABLE `profile`
  ADD COLUMN `about_photo_url` VARCHAR(255) DEFAULT NULL
    COMMENT 'Photo dédiée à la page À propos (utilisée quand about_use_drawer_photo = 0)',
  ADD COLUMN `cover_url` VARCHAR(255) DEFAULT NULL
    COMMENT 'Image de couverture / bannière en haut de la section À propos',
  ADD COLUMN `about_use_drawer_photo` TINYINT(1) NOT NULL DEFAULT 1
    COMMENT '1 = afficher photo_url dans À propos (même que drawer), 0 = afficher about_photo_url';
