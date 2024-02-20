-- Demonstrates vacuum to reclaim unused space
-- Uses movies.db

-- Drops existing indexes
DROP INDEX IF EXISTS "title_index";
DROP INDEX IF EXISTS "people_index";
DROP INDEX IF EXISTS "name_index";

-- Runs vacuum to reclaim space
VACUUM;
