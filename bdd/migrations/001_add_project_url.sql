ALTER TABLE `projects`
    ADD COLUMN `url` VARCHAR(255) AFTER `date`;

UPDATE `projects` SET `url` = 'https://www.around-virtual.fr', `github_url` = NULL WHERE `name` = 'around-virtual.fr';
UPDATE `projects` SET `url` = 'https://www.av-production.fr',  `github_url` = NULL WHERE `name` = 'av-production.fr';
UPDATE `projects` SET `url` = 'https://administra-vie.fr',     `github_url` = NULL WHERE `name` = 'administra-vie.fr';
