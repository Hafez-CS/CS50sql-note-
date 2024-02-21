-- Demonstrates prepared statements
-- Uses `bank` database

-- Creates a prepared statement
PREPARE `balance_check`
FROM 'SELECT * FROM `accounts`
WHERE `id` = ?';

-- Executes the prepared statement with non-malicious input
SET @id = 1;
EXECUTE `balance_check` USING @id;

-- Executes the prepared statement with malicious input
SET @id = '1 UNION SELECT * FROM `accounts`';
EXECUTE `balance_check` USING @id;
