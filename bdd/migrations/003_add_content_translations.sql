-- Migration 003 : tables de traductions pour les contenus dynamiques

CREATE TABLE IF NOT EXISTS `experience_translations` (
    `id`            INT PRIMARY KEY AUTO_INCREMENT,
    `experience_id` INT NOT NULL,
    `locale`        VARCHAR(5) NOT NULL,
    `role`          VARCHAR(200) NOT NULL,
    `type`          VARCHAR(50),
    `description`   TEXT,
    UNIQUE KEY `uq_exp_locale` (`experience_id`, `locale`),
    FOREIGN KEY (`experience_id`) REFERENCES `experiences`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `formation_translations` (
    `id`           INT PRIMARY KEY AUTO_INCREMENT,
    `formation_id` INT NOT NULL,
    `locale`       VARCHAR(5) NOT NULL,
    `title`        VARCHAR(200) NOT NULL,
    `level`        VARCHAR(100),
    `description`  TEXT,
    UNIQUE KEY `uq_form_locale` (`formation_id`, `locale`),
    FOREIGN KEY (`formation_id`) REFERENCES `formations`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `project_translations` (
    `id`          INT PRIMARY KEY AUTO_INCREMENT,
    `project_id`  INT NOT NULL,
    `locale`      VARCHAR(5) NOT NULL,
    `name`        VARCHAR(200) NOT NULL,
    `description` TEXT,
    `category`    VARCHAR(100),
    UNIQUE KEY `uq_proj_locale` (`project_id`, `locale`),
    FOREIGN KEY (`project_id`) REFERENCES `projects`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `profile_translations` (
    `id`     INT PRIMARY KEY AUTO_INCREMENT,
    `locale` VARCHAR(5) NOT NULL UNIQUE,
    `title`  VARCHAR(200) NOT NULL,
    `status` VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
