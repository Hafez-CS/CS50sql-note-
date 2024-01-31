-- Demonstrates empty values with NULL
-- Uses longlist.db

-- Finds books without a translator
SELECT "title", "translator" FROM "longlist" WHERE "translator" IS NULL;

-- Finds books with a translator
SELECT "title", "translator" FROM "longlist" WHERE "translator" IS NOT NULL;
