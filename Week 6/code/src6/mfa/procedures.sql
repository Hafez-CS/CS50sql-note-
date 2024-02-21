-- Demonstrates stored procedures

-- Set up database
USE `mfa`;

-- Add deleted column to columns
ALTER TABLE `collections` 
ADD COLUMN `deleted` TINYINT DEFAULT 0;

-- Create a stored procedure to view all (non-deleted) items in collections
delimiter //
CREATE PROCEDURE `current_collections`()
BEGIN
SELECT `title`, `accession_number`, `acquired` FROM `collections` WHERE `deleted` = 0;
END//
delimiter ;

-- Call the stored procedure
CALL `current_collections`();

-- Set an item to be deleted
UPDATE `collections` SET `deleted` = 1 
WHERE `title` = 'Farmers working at dawn';

-- Call stored procedure again
CALL `current_collections`();

-- Create a table to log artwork transactions
CREATE TABLE `transactions` (
    `id` INT AUTO_INCREMENT,
    `title` VARCHAR(64) NOT NULL,
    `action` ENUM('bought', 'sold') NOT NULL,
    PRIMARY KEY(`id`)
);

-- Create a stored procedure with a parameter to mark artwork sold
delimiter //
CREATE PROCEDURE `sell`(IN `sold_id` INT)
BEGIN
UPDATE `collections` SET `deleted` = 1 WHERE `id` = `sold_id`;
INSERT INTO `transactions` (`title`, `action`)
VALUES ((SELECT `title` FROM `collections` WHERE `id` = `sold_id`), 'sold');
END//
delimiter ;

-- Sell a piece of artwork
CALL `sell`((
    SELECT `id` FROM `collections`
    WHERE `title` = 'Farmers working at dawn'
));

-- Show results
SELECT * FROM `transactions`;
SELECT * FROM `collections`;

-- Improve procecure to handle corner cases
DROP PROCEDURE `sell`;

-- Create a stored procedure to handle case where item is already deleted
delimiter //
CREATE PROCEDURE `sell`(IN `sold_id` INT)
BEGIN
IF `sold_id` IN (
    SELECT `id` FROM `collections` WHERE `deleted` = 0
) THEN
    UPDATE `collections` SET `deleted` = 1 WHERE `id` = `sold_id`;
    INSERT INTO `transactions` (`title`, `action`)
    VALUES ((SELECT `title` FROM `collections` WHERE `id` = `sold_id`), 'sold');
END IF;
END//
delimiter ;

-- Show using status code
delimiter //
CREATE PROCEDURE `sell`(IN `sold_id` INT)
BEGIN
IF `sold_id` NOT IN (
    SELECT `id` FROM `collections` WHERE `deleted` = 0
) THEN
    SIGNAL SQLSTATE '45000';
END IF;
UPDATE `collections` SET `deleted` = 1 WHERE `id` = `sold_id`;
INSERT INTO `transactions` (`title`, `action`)
VALUES ((SELECT `title` FROM `collections` WHERE `id` = `sold_id`), 'sold');
END//
delimiter ;
