-- 024 — Table de configuration globale du site
CREATE TABLE IF NOT EXISTS `site_config` (
  `config_key`   VARCHAR(100) NOT NULL,
  `config_value` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`config_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `site_config` (`config_key`, `config_value`) VALUES
  ('default_tab', 'about'),
  ('home_tab',    'about');
