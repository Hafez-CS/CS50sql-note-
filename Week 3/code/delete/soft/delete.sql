-- Add a "deleted" column to "collections" table
ALTER TABLE "collections" ADD COLUMN "deleted" INTEGER DEFAULT 0;

-- View updated schema of collections table
.schema "collections"

-- View data
SELECT * FROM "collections";

-- Instead of deleting an item, update its deleted column to be 1
UPDATE "collections" SET "deleted" = 1 WHERE "title" = 'Farmers working at dawn';

-- Select all items from collections that are not deleted
SELECT * FROM "collections" WHERE "deleted" != 1;