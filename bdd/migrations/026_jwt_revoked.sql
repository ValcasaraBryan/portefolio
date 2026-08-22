-- Migration 026 : table de révocation des access tokens JWT (logout)
-- Un JTI (JWT ID, UUID v4) est inséré ici lors du logout.
-- jwt_guard.php vérifie cette table à chaque requête protégée.
-- Les entrées peuvent être purgées dès que expires_at < NOW().

CREATE TABLE IF NOT EXISTS jwt_revoked_tokens (
  jti        VARCHAR(36) NOT NULL,
  expires_at DATETIME    NOT NULL,
  revoked_at TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (jti),
  INDEX idx_expires_at (expires_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
