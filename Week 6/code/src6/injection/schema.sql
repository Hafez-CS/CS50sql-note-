-- Schema for bank DB

CREATE DATABASE IF NOT EXISTS `bank`;
USE `bank`;

CREATE TABLE `accounts` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(16),
    `balance` INT,
    PRIMARY KEY(`id`)
);

INSERT INTO `accounts` (`name`, `balance`)
VALUES
('Alice', 10),
('Bob', 20),
('Charlie', 30);
