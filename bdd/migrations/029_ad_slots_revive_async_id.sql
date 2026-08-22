-- 029 — Ajoute le token data-revive-id requis par le tag "Asynchronous JS"
-- de Revive Adserver (absent du schéma initial de la migration 028).

ALTER TABLE `ad_slots`
    ADD COLUMN `revive_async_id` VARCHAR(64) NULL AFTER `revive_zone_id`;
