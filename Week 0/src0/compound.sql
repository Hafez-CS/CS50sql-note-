-- Demonstrates compound conditions
-- Uses longlist.db

-- Finds books nominated in 2022 or 2023
SELECT "title", "year" FROM "longlist" WHERE "year" = 2022 OR "year" = 2023;

-- Finds hardcover books nominated in 2022 or 2023
SELECT "title", "year" FROM "longlist" WHERE ("year" = 2022 OR "year" = 2023) AND "format" = 'hardcover';

-- Find all books nominated between 2019 and 2022 using many ORs
SELECT "title", "year" FROM "longlist" 
WHERE "year" = 2019 OR "year" = 2020 OR "year" = 2021 OR "year" = 2022;
