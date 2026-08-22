-- 023 — Table de configuration des URLs par onglet
CREATE TABLE IF NOT EXISTS `tab_routes` (
  `tab_name`    VARCHAR(50)  NOT NULL,
  `url_path`    VARCHAR(200) NOT NULL,
  `order_index` TINYINT      NOT NULL DEFAULT 0,
  PRIMARY KEY (`tab_name`),
  UNIQUE KEY `uq_url_path` (`url_path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tab_routes` (`tab_name`, `url_path`, `order_index`) VALUES
  ('about',       '/about',       1),
  ('experiences', '/experiences', 2),
  ('creations',   '/projets',     3),
  ('formations',  '/formations',  4),
  ('contact',     '/contact',     5);
