-- 028 — Bannières publicitaires (multi-régie, multi-encart)
-- Config opérationnelle non traduisible : pas de table *_translations.

CREATE TABLE IF NOT EXISTS `ad_slots` (
    `id`                 INT PRIMARY KEY AUTO_INCREMENT,
    `label`              VARCHAR(100) NOT NULL,
    `placement`          ENUM('sidebar') NOT NULL DEFAULT 'sidebar',
    `provider`           ENUM('revive_iframe','revive_js','adsense') NOT NULL,
    `is_active`          TINYINT(1)   NOT NULL DEFAULT 0,
    `weight`             INT          NOT NULL DEFAULT 1,
    `width`              INT          NULL,
    `height`             INT          NULL,
    `revive_server_url`  VARCHAR(255) NULL,
    `revive_zone_id`     VARCHAR(20)  NULL,
    `adsense_client_id`  VARCHAR(30)  NULL,
    `adsense_slot_id`    VARCHAR(20)  NULL,
    `created_at`         TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`         TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX `idx_placement_active` (`placement`, `is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
