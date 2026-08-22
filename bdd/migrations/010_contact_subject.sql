-- 010 — Ajout du champ subject sur contact_messages
ALTER TABLE `contact_messages`
  ADD COLUMN IF NOT EXISTS `subject` VARCHAR(255) DEFAULT NULL AFTER `email`;
