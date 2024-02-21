-- Demonstrates types in MySQL

-- Create and use database
CREATE DATABASE IF NOT EXISTS `mbta`;
USE `mbta`;

-- Riders are represented by cards
CREATE TABLE `cards` (
    `id` INT AUTO_INCREMENT,
    PRIMARY KEY(`id`)
);

DESCRIBE `cards`;

-- Stations have a name and a line
CREATE TABLE `stations` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL UNIQUE,
    `line` ENUM('blue', 'green', 'orange', 'red') NOT NULL,
    PRIMARY KEY(`id`)
);

DESCRIBE `stations`;

-- Cards can swipe at a station, in order to enter, exit, or deposit funds
CREATE TABLE `swipes` (
    `id` INT AUTO_INCREMENT,
    `card_id` INT,
    `station_id` INT,
    `type` ENUM('enter', 'exit', 'deposit') NOT NULL,
    `datetime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `amount` DECIMAL(5,2) NOT NULL CHECK(`amount` != 0),
    PRIMARY KEY(`id`),
    FOREIGN KEY(`station_id`) REFERENCES `stations`(`id`),
    FOREIGN KEY(`card_id`) REFERENCES `cards`(`id`)
);

DESCRIBE `swipes`;

SHOW TABLES;
