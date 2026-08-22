-- 021 — Nom personnalisable du fichier CV téléchargé
-- Ajoute cv_download_name dans profile (fallback global)
-- et dans profile_translations (override par locale).

ALTER TABLE `profile`
  ADD COLUMN `cv_download_name` VARCHAR(255) NOT NULL DEFAULT 'cv.pdf'
    COMMENT 'Nom par défaut du fichier PDF proposé au téléchargement';

ALTER TABLE `profile_translations`
  ADD COLUMN `cv_download_name` VARCHAR(255) DEFAULT NULL
    COMMENT 'Override du nom de téléchargement par locale (NULL = utilise profile.cv_download_name)';
