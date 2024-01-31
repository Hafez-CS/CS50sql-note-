-- Demonstrates aggregating with aggregation functions
-- Uses longlist.db

-- Finds the average rating of all longlisted books
SELECT AVG("rating") FROM "longlist";

-- Rounds the result
SELECT ROUND(AVG("rating"), 2) FROM "longlist";

-- Renames column with AS
SELECT ROUND(AVG("rating"), 2) AS "Average Rating" FROM "longlist";

-- Finds maximum rating
SELECT MAX("rating") FROM "longlist";

-- Finds minimum rating
SELECT MIN("rating") FROM "longlist";

-- Finds total number of votes
SELECT SUM("votes") FROM "longlist";

-- Finds total number of books
SELECT COUNT(*) FROM "longlist";

-- Finds total number of translators
SELECT COUNT("translator") FROM "longlist";

-- Incorrectly counts publishers
SELECT COUNT("publisher") FROM "longlist";

-- Correctly counts publishers
SELECT COUNT(DISTINCT "publisher") FROM "longlist";
