-- Demonstrates expanded ALTER TABLE support in MySQL (vs. SQLite)
-- https://www.sqlite.org/omitted.html

-- Add a new line
ALTER TABLE `stations` 
MODIFY `line` ENUM('blue', 'green', 'orange', 'red', 'silver') NOT NULL;
