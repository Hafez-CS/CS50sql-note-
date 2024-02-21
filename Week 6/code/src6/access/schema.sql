-- Schema for rideshare DB

CREATE DATABASE IF NOT EXISTS `rideshare`;
USE `rideshare`;

CREATE TABLE `rides` (
    `id` INT AUTO_INCREMENT,
    `origin` VARCHAR(64) NOT NULL,
    `destination` VARCHAR(64) NOT NULL,
    `rider` VARCHAR(16) NOT NULL,
    PRIMARY KEY(`id`)
);

INSERT INTO `rides` (`origin`, `destination`, `rider`)
VALUES
('Good Egg Galaxy', 'Honeyhive Galaxy', 'Peach'),
('Castle Courtyard', 'Cascade Kingdom', 'Mario'),
('Metro Kingdom', 'Mushroom Kingdom', 'Luigi'),
('Seaside Kingdom', 'Deep Woods', 'Bowser');

CREATE VIEW `analysis` AS
SELECT `id`, `origin`, `destination`
FROM `rides`;
