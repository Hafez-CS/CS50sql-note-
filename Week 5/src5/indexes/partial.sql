-- Demonstrates partial indexes
-- Uses movies.db

-- Times searching for movies in 2023
.timer on
SELECT "title" FROM "movies" WHERE "year" = 2023;

-- Creates a partial index to speed up searches involving the present year
CREATE INDEX "recents" ON "movies" ("title")
WHERE "year" = 2023;

-- Reruns query
SELECT "title" FROM "movies" WHERE "year" = 2023;

-- Shows query's usage of index
EXPLAIN QUERY PLAN
SELECT "title" FROM "movies" WHERE "year" = 2023;

-- Shows not using an index after creating a partial index
EXPLAIN QUERY PLAN
SELECT "title" FROM "movies" WHERE "year" = 1998;
