-- Demonstrates expanded ALTER TABLE support in MySQL compared to SQLite
-- https://www.sqlite.org/omitted.html
-- Uses `mbta` database

-- Adds a new MBTA line
ALTER TABLE `stations` 
MODIFY `line` ENUM('blue', 'green', 'orange', 'red', 'silver') NOT NULL;
