-- Demonstrates single-column indexes
-- Uses movies.db

-- Shows schema of movies.db
.schema

-- Peeks at movies table
SELECT * FROM "movies" LIMIT 5;

-- Searches for a movie with a unique entry
SELECT * FROM "movies" WHERE "title" = 'Cars';

-- Searches again, with timer
.timer on
SELECT * FROM "movies" WHERE "title" = 'Cars';
.timer off

-- Creates index on titles column, with timer
.timer on
CREATE INDEX "title_index" ON "movies" ("title");
.timer off

-- Shows index as part of schema
.schema

-- Searches again, via index, with timer
.timer on
SELECT * FROM "movies" WHERE "title" = 'Cars';
.timer off

-- Uses EXPLAIN QUERY PLAN to show use of index
EXPLAIN QUERY PLAN
SELECT * FROM "movies" WHERE "title" = 'Cars';

-- Deletes "title_index" index
DROP INDEX "title_index";

-- Shows query plan without index
EXPLAIN QUERY PLAN
SELECT * FROM "movies" WHERE "title" = 'Cars';
