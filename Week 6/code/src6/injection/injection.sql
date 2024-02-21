-- Demonstrates SQL injection attacks

-- Execute statement with non-malicious input
SELECT * FROM `accounts`
WHERE `id` = 1;

-- Execute statement with malicious input
SELECT * FROM `accounts`
WHERE `id` = 1 UNION SELECT * FROM `accounts`;
