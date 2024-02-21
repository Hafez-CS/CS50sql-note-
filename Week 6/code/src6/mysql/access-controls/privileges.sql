-- Demonstrates granting and revoking privileges in MySQL
-- Uses `rideshare` database

-- Creates a new user with username 'carter' and password 'password'
CREATE USER 'carter' IDENTIFIED BY 'password';

-- As Carter, fails to show databases
SHOW DATABASES;

-- As root user, grants SELECT privileges on only the `analysis` view in the `rideshare` database
GRANT SELECT ON `rideshare`.`analysis` TO 'carter';

-- As Carter, succeeds in showing `rideshare` database
SHOW DATABASES;
USE `rideshare`;

-- As Carter, succeeds in selecting from `analysis`
SELECT * FROM `analysis`;

-- As Carter, fails to select from `rides` table
SELECT * FROM `rides`;

-- As Carter, fails to create a new view
CREATE VIEW `destinations` AS
SELECT `destination` FROM `analysis`;

-- As root user, grants privileges to 'carter' to create a view on any table in the `ridershare` database
GRANT CREATE VIEW ON `rideshare`.* TO 'carter';

-- As Carter, succeeds in creating a view
CREATE VIEW `destinations` AS
SELECT `destination` FROM `analysis`;
