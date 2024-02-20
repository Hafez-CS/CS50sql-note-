-- Demonstrates foreign key indexes
-- Uses movies.db

-- Times searching for movies Tom Hanks has starred in
.timer on
SELECT "title" FROM "movies" WHERE "id" IN (
    SELECT "movie_id" FROM "stars" WHERE "person_id" = (
        SELECT "id" FROM "people" WHERE "name" = 'Tom Hanks'
    )
);
.timer off

-- Identifies which columns we should create indexes on
EXPLAIN QUERY PLAN
SELECT "title" FROM "movies" WHERE "id" IN (
    SELECT "movie_id" FROM "stars" WHERE "person_id" = (
        SELECT "id" FROM "people" WHERE "name" = 'Tom Hanks'
    )
);

-- Creates index on foreign key
.timer on
CREATE INDEX "person_index" ON "stars" ("person_id");

-- Creates index to speed name lookups
CREATE INDEX "name_index" ON "people" ("name");
.timer off

EXPLAIN QUERY PLAN
SELECT "title" FROM "movies" WHERE "id" IN (
    SELECT "movie_id" FROM "stars" WHERE "person_id" = (
        SELECT "id" FROM "people" WHERE "name" = 'Tom Hanks'
    )
);

-- Makes "person_index" a covering index for the above query
CREATE INDEX "person_index" ON "stars" ("person_id", "movie_id");

EXPLAIN QUERY PLAN
SELECT "title" FROM "movies" WHERE "id" IN (
    SELECT "movie_id" FROM "stars" WHERE "person_id" = (
        SELECT "id" FROM "people" WHERE "name" = 'Tom Hanks'
    )
);

-- Finds runtime with usage of indexes
.timer on
SELECT "title" FROM "movies" WHERE "id" IN (
    SELECT "movie_id" FROM "stars" WHERE "person_id" IN (
        SELECT "id" FROM "people" WHERE "name" = 'Tom Hanks'
    )
);
.timer off
