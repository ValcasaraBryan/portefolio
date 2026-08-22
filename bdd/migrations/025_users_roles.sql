-- Migration 025 : extension admin_users avec rôles, permissions fine-grained et métadonnées

ALTER TABLE admin_users
  ADD COLUMN email         VARCHAR(255) NULL    AFTER username,
  ADD COLUMN role          ENUM('superadmin','admin','editor') NOT NULL DEFAULT 'admin' AFTER email,
  ADD COLUMN permissions   JSON         NULL    COMMENT 'Overrides de permissions par feature/action' AFTER role,
  ADD COLUMN last_login_at DATETIME     NULL    AFTER permissions;

-- Promouvoir le premier admin existant en superadmin
UPDATE admin_users
SET role = 'superadmin'
WHERE id = (SELECT MIN(id) FROM (SELECT id FROM admin_users) AS sub);
