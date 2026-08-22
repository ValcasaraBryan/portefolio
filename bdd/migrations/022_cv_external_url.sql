-- 022 — URL externe du CV par locale
-- Permet de pointer le lien CV vers une URL externe (Drive, CDN…)
-- à la place du fichier uploadé sur le serveur.

ALTER TABLE `profile_translations`
  ADD COLUMN `cv_external_url` VARCHAR(2048) DEFAULT NULL
    COMMENT 'URL externe du CV (prioritaire sur le fichier uploadé si renseignée)';
