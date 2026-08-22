CREATE TABLE IF NOT EXISTS `profile` (
    `id`        INT PRIMARY KEY AUTO_INCREMENT,
    `name`      VARCHAR(100) NOT NULL,
    `title`     VARCHAR(200) NOT NULL,
    `photo_url` VARCHAR(255),
    `location`  VARCHAR(100),
    `status`    VARCHAR(100),
    `email`     VARCHAR(255),
    `phone`     VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `links` (
    `id`       INT PRIMARY KEY AUTO_INCREMENT,
    `platform` VARCHAR(50)  NOT NULL,
    `url`      VARCHAR(255) NOT NULL,
    `icon`     VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `skills` (
    `id`       INT PRIMARY KEY AUTO_INCREMENT,
    `name`     VARCHAR(100) NOT NULL,
    `category` VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `experiences` (
    `id`          INT PRIMARY KEY AUTO_INCREMENT,
    `company`     VARCHAR(100) NOT NULL,
    `role`        VARCHAR(200) NOT NULL,
    `type`        ENUM('internship','permanent_contract','fixed_term_contract',
                       'work_study','freelance','self_employed') NULL,
    `location`    VARCHAR(100),
    `start_date`  DATE,
    `end_date`    DATE,
    `description` TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `experience_skills` (
    `id`            INT PRIMARY KEY AUTO_INCREMENT,
    `experience_id` INT NOT NULL,
    `skill_id`      INT NOT NULL,
    FOREIGN KEY (`experience_id`) REFERENCES `experiences`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`skill_id`)      REFERENCES `skills`(`id`)      ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `projects` (
    `id`          INT PRIMARY KEY AUTO_INCREMENT,
    `name`        VARCHAR(200) NOT NULL,
    `photo_url`   VARCHAR(255),
    `description` TEXT,
    `date`        DATE,
    `url`         VARCHAR(255),
    `github_url`  VARCHAR(255),
    `category`    ENUM('web','opensource','side') NULL,
    `is_favorite` TINYINT(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `project_skills` (
    `id`         INT PRIMARY KEY AUTO_INCREMENT,
    `project_id` INT NOT NULL,
    `skill_id`   INT NOT NULL,
    FOREIGN KEY (`project_id`) REFERENCES `projects`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`skill_id`)   REFERENCES `skills`(`id`)   ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `formations` (
    `id`          INT PRIMARY KEY AUTO_INCREMENT,
    `school`      VARCHAR(200) NOT NULL,
    `title`       VARCHAR(200) NOT NULL,
    `level`       VARCHAR(100),
    `city`        VARCHAR(100),
    `start_date`  DATE,
    `end_date`    DATE,
    `description` TEXT,
    `mention`     VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `formation_skills` (
    `id`           INT PRIMARY KEY AUTO_INCREMENT,
    `formation_id` INT NOT NULL,
    `skill_id`     INT NOT NULL,
    FOREIGN KEY (`formation_id`) REFERENCES `formations`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`skill_id`)     REFERENCES `skills`(`id`)     ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `certifications` (
    `id`           INT PRIMARY KEY AUTO_INCREMENT,
    `year`         INT,
    `name`         VARCHAR(200) NOT NULL,
    `formation_id` INT,
    FOREIGN KEY (`formation_id`) REFERENCES `formations`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `skill_translations` (
    `id`       INT PRIMARY KEY AUTO_INCREMENT,
    `skill_id` INT NOT NULL,
    `locale`   VARCHAR(5) NOT NULL,
    `name`     VARCHAR(100) NOT NULL,
    `category` VARCHAR(100) NOT NULL,
    UNIQUE KEY `uq_skill_locale` (`skill_id`, `locale`),
    FOREIGN KEY (`skill_id`) REFERENCES `skills`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
    UNIQUE KEY `uq_proj_locale` (`project_id`, `locale`),
    FOREIGN KEY (`project_id`) REFERENCES `projects`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `profile_translations` (
    `id`     INT PRIMARY KEY AUTO_INCREMENT,
    `locale` VARCHAR(5) NOT NULL UNIQUE,
    `title`  VARCHAR(200) NOT NULL,
    `status` VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `contact_messages` (
    `id`      INT PRIMARY KEY AUTO_INCREMENT,
    `name`    VARCHAR(100) NOT NULL,
    `email`   VARCHAR(255) NOT NULL,
    `message` TEXT        NOT NULL,
    `sent_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
