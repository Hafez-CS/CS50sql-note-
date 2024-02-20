-- Demonstrates vacuum to reclaim unused space
-- movies.db

-- Drop existing indexes
DROP INDEX IF EXISTS "title_index";
DROP INDEX IF EXISTS "people_index";
DROP INDEX IF EXISTS "name_index";

-- Run vacuum to reclaim space
VACUUM;
