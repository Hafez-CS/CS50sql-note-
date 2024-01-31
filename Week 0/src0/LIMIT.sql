-- Demonstrates limiting results with LIMIT
-- Uses longlist.db

-- Limits results to first 3 rows
SELECT "title", "author" FROM "longlist" LIMIT 3;

-- Limits results to first 10 rows
SELECT "title", "author" FROM "longlist" LIMIT 10;
