-- Demonstrates soft deletes
-- Uses mfa.db

-- Views data in "collections" table
SELECT * FROM "collections";

-- Views schema of collections table
.schema collections

-- Adds a "deleted" column to "collections" table
ALTER TABLE "collections" ADD COLUMN "deleted" INTEGER DEFAULT 0;

-- Views updated data in "collections table"
SELECT * FROM "collections";

-- Views updated schema of collections table
.schema collections

-- Instead of deleting an item, updates its deleted column to be 1
UPDATE "collections" SET "deleted" = 1 WHERE "title" = 'Farmers working at dawn';

-- Selects all items from collections that are not deleted
SELECT * FROM "collections" WHERE "deleted" = 0;

-- Creates a view to show only items in collections that are NOT deleted
CREATE VIEW "current_collections" AS
SELECT "id", "title", "accession_number", "acquired" FROM "collections" WHERE "deleted" = 0;

-- Selects from "current_collections" view to see non-deleted items
SELECT * FROM "current_collections";

-- Fails to delete an item from the view
DELETE FROM "current_collections" WHERE "title" = 'Imaginative landscape';

-- Creates trigger to delete items from a view
CREATE TRIGGER "delete"
INSTEAD OF DELETE ON "current_collections"
FOR EACH ROW
BEGIN
    UPDATE "collections" SET "deleted" = 1 WHERE "id" = OLD."id";
END;

-- Creates trigger to revert an item's deletion
CREATE TRIGGER "insert_when_exists"
INSTEAD OF INSERT ON "current_collections"
FOR EACH ROW 
WHEN NEW."accession_number" IN (SELECT "accession_number" FROM "collections")
BEGIN
    UPDATE "collections" SET "deleted" = 0 WHERE "accession_number" = NEW."accession_number";
END;

-- Creates trigger to insert a new item into collections
CREATE TRIGGER "insert_when_new"
INSTEAD OF INSERT ON "current_collections"
FOR EACH ROW
WHEN NEW."accession_number" NOT IN (SELECT "accession_number" FROM "collections")
BEGIN
    INSERT INTO "collections" ("title", "accession_number", "acquired")
    VALUES (NEW."title", NEW."accession_number", NEW."acquired");
END;
