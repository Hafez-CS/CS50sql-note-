-- Demonstrates partial indexes
-- movies.db

-- Time searching for movies in 2023
.timer on
SELECT "title" FROM "movies" WHERE "year" = 2023;

-- Create a partial index to speed up searches involving the present year
CREATE INDEX "recents" ON "movies" ("title")
WHERE "year" = 2023;

-- Rerun query
SELECT "title" FROM "movies" WHERE "year" = 2023;

-- Show query's usage of index
EXPLAIN QUERY PLAN
SELECT "title" FROM "movies" WHERE "year" = 2023;

-- Show not using an index after creating a partial index
EXPLAIN QUERY PLAN
SELECT "title" FROM "movies" WHERE "year" = 1998;
