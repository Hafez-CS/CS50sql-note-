-- Find the average rating of all longlisted books
SELECT AVG("rating") FROM "longlist";

-- Round the result
SELECT ROUND(AVG("rating"), 2) FROM "longlist";

-- Rename column with AS
SELECT ROUND(AVG("rating"), 2) AS "Average Rating" FROM "longlist";

-- Find maximum rating
SELECT MAX("rating") FROM "longlist";

-- Find minimum rating
SELECT MIN("rating") FROM "longlist";

-- Find total number of votes
SELECT SUM("votes") FROM "longlist";

-- Find total number of books
SELECT COUNT(*) FROM "longlist";

-- Find total number of translators
SELECT COUNT("translator") FROM "longlist";

-- Incorrectly count publishers
SELECT COUNT("publisher") FROM "longlist";

-- Correctly count publishers
SELECT COUNT(DISTINCT "publisher") FROM "longlist";