-- 019 — Description individuelle par skill (traduisible FR/EN)
ALTER TABLE `skill_translations`
  ADD COLUMN `description` TEXT NULL AFTER `category`;
