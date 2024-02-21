-- Demonstrates loading data from a CSV file

-- Load a CSV of riders into the riders table
LOAD DATA INFILE 'red.csv'
INTO TABLE `stations`
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
