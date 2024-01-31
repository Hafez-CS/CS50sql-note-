-- Find titles from 2022 or 2023
SELECT "title", "year" FROM "longlist" WHERE "year" = 2022 OR "year" = 2023;

-- Find hardcover books from 2022 and 2023
SELECT "title", "year" FROM "longlist" WHERE ("year" = 2022 OR "year" = 2023) AND "format" = 'hardcover';

-- Find books between 2019 and 2022
-- Using many ORs
SELECT "title", "year" FROM "longlist" 
WHERE "year" = 2019 OR "year" = 2020 OR "year" = 2021 OR "year" = 2022;