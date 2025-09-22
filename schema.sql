-- יצירת מסד נתונים אם לא קיים
CREATE DATABASE IF NOT EXISTS connect4
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;

USE connect4;

-- טבלת משחקים
CREATE TABLE IF NOT EXISTS games (
  id INT AUTO_INCREMENT PRIMARY KEY,
  code CHAR(6) NOT NULL UNIQUE,
  board VARCHAR(42) NOT NULL,
  turn ENUM('red','yellow') NOT NULL DEFAULT 'red',
  status ENUM('wait','playing','win','draw') NOT NULL DEFAULT 'wait',
  last_move_row TINYINT NULL,
  last_move_col TINYINT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- טבלת שחקנים
CREATE TABLE IF NOT EXISTS players (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  game_id INT NOT NULL,
  pid CHAR(16) NOT NULL,
  name VARCHAR(80) NOT NULL DEFAULT '',
  color ENUM('red','yellow') NOT NULL,
  UNIQUE KEY unique_player_in_game (game_id, color),
  FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE
);
