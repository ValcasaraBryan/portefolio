-- 020 — Favicon personnalisé
-- Ajoute une colonne favicon_url dans la table profile
-- pour permettre la gestion du favicon depuis le panel admin.

ALTER TABLE `profile`
  ADD COLUMN `favicon_url` VARCHAR(255) DEFAULT NULL
    COMMENT 'URL du favicon personnalisé (PNG, SVG, ICO, WebP)';
