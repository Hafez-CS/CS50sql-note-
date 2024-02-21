-- Demonstrates SQL injection attacks
-- Uses `bank` database

-- Executes statement with non-malicious input
SELECT * FROM `accounts`
WHERE `id` = 1;

-- Executes statement with malicious input
SELECT * FROM `accounts`
WHERE `id` = 1 UNION SELECT * FROM `accounts`;
