-- Demonstrates prepared statements

-- Create a prepared statement
PREPARE `balance_check`
FROM 'SELECT * FROM `accounts`
WHERE `id` = ?';

-- Execute the prepared statement with non-malicious input
-- Set a user variable
SET @id = 1;
EXECUTE `balance_check` USING @id;

-- Execute the prepared statement with malicious input
-- Set a user variable
SET @id = '1 UNION SELECT * FROM `accounts`';
EXECUTE `balance_check` USING @id;
