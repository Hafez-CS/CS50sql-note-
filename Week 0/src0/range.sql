-- Demonstrates range conditions
-- Uses longlist.db

-- Find all books nominated between 2019 and 2022 with a range condition
SELECT "title", "year" FROM "longlist" WHERE "year" >= 2019 AND "year" <= 2022;

-- Find all books nominated between 2019 and 2022 with BETWEEN
SELECT "title", "year" FROM "longlist" WHERE "year" BETWEEN 2019 AND 2022;

-- Selects books with a rating above 4.0
SELECT "title", "rating" FROM "longlist" WHERE "rating" > 4.0;

-- Selects books with a rating above 4.0 and at least 1000 votes
SELECT "title", "rating" FROM "longlist" WHERE "rating" > 4.0 AND "votes" > 1000;

-- Selects books with fewer than 300 pages
SELECT "title", "pages" FROM "longlist" WHERE "pages" < 300;
