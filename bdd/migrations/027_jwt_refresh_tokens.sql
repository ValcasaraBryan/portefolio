-- Migration 027 : table des refresh tokens JWT
-- Le token brut est une chaîne aléatoire 64 bytes (hex).
-- Seul son hash SHA-256 est stocké en base.
-- Rotation : à chaque refresh, l'ancien token est révoqué et un nouveau est émis.

CREATE TABLE IF NOT EXISTS jwt_refresh_tokens (
  id          INT          NOT NULL AUTO_INCREMENT,
  user_id     INT          NOT NULL,
  token_hash  VARCHAR(64)  NOT NULL UNIQUE COMMENT 'SHA-256 du token brut',
  expires_at  DATETIME     NOT NULL,
  revoked     TINYINT(1)   NOT NULL DEFAULT 0,
  created_at  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  INDEX idx_user_id   (user_id),
  INDEX idx_expires_at (expires_at),
  CONSTRAINT fk_jrt_user FOREIGN KEY (user_id) REFERENCES admin_users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
