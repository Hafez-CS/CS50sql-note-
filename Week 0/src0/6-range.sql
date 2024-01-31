-- Rewrite prior query with a range condition
SELECT "title", "year" FROM "longlist" WHERE "year" >= 2019 AND "year" <= 2022;

-- Rewrite with a BETWEEN condition
SELECT "title", "year" FROM "longlist" WHERE "year" BETWEEN 2019 AND 2022;

-- Select books with a rating above 4.0
SELECT "title", "rating" FROM "longlist" WHERE "rating" > 4.0;

-- Select books with a rating above 4.0 and at least 1000 votes
SELECT "title", "rating" FROM "longlist" WHERE "rating" > 4.0 AND "votes" > 1000;

-- Select books with fewer than 300 pages
SELECT "title", "pages" FROM "longlist" WHERE "pages" < 300;
