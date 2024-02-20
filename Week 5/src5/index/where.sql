-- Demonstrates single-column indexes
-- movies.db

-- Show schema of movies.db
.schema

-- Peek at movies table
SELECT * FROM "movies" LIMIT 5;

-- Search for a movie with a unique entry
SELECT * FROM "movies" WHERE "title" = 'Cars';

-- Search again, save terminal window
.timer on
SELECT * FROM "movies" WHERE "title" = 'Cars';
.timer off

-- Open new terminal window, create index on titles column
.timer on
CREATE INDEX "title_index" ON "movies" ("title");
.timer off

-- Show index as part of schema
.schema

-- Search again, via index
.timer on
SELECT * FROM "movies" WHERE "title" = 'Cars';
.timer off

-- Use EXPLAIN QUERY PLAN to show use of index
EXPLAIN QUERY PLAN
SELECT * FROM "movies" WHERE "title" = 'Cars';

-- DROP INDEX
DROP INDEX "title_index";

-- Show query plan without index
EXPLAIN QUERY PLAN
SELECT * FROM "movies" WHERE "title" = 'Cars';
