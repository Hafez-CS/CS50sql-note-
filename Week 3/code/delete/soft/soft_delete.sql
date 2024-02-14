-- Demonstrates soft deletes
-- Uses mfa.db

-- Adds a "deleted" column to "collections" table
ALTER TABLE "collections" ADD COLUMN "deleted" INTEGER DEFAULT 0;

-- Views updated schema of collections table
.schema "collections"

-- Views data
SELECT * FROM "collections";

-- Instead of deleting an item, updates its deleted column to be 1
UPDATE "collections" SET "deleted" = 1 WHERE "title" = 'Farmers working at dawn';

-- Selects all items from collections that are not deleted
SELECT * FROM "collections" WHERE "deleted" != 1;
