-- Soft deletions
-- mfa.db

-- View data
SELECT * FROM "collections";

-- View updated schema of collections table
.schema collections

-- Add a "deleted" column to "collections" table
ALTER TABLE "collections" ADD COLUMN "deleted" INTEGER DEFAULT 0;

-- View data
SELECT * FROM "collections";

-- View updated schema of collections table
.schema collections

-- Instead of deleting an item, update its deleted column to be 1
UPDATE "collections" SET "deleted" = 1 WHERE "title" = 'Farmers working at dawn';

-- Select all items from collections that are not deleted
SELECT * FROM "collections" WHERE "deleted" = 0;

-- Create a view with the same name as the collections table
CREATE VIEW "current_collections" AS
SELECT "id", "title", "accession_number", "acquired" FROM "collections" WHERE "deleted" = 0;

-- Select all from collections to see non-deleted items
SELECT * FROM "current_collections";

-- Fail to delete an item from the view
DELETE FROM "current_collections" WHERE "title" = 'Imaginative landscape';

-- Create trigger to delete items from a view
CREATE TRIGGER "delete"
INSTEAD OF DELETE ON "current_collections"
FOR EACH ROW
BEGIN
    UPDATE "collections" SET "deleted" = 1 WHERE "id" = OLD."id";
END;

-- Create trigger to revert an item's deletion
CREATE TRIGGER "insert_when_exists"
INSTEAD OF INSERT ON "current_collections"
FOR EACH ROW 
WHEN NEW."accession_number" IN (SELECT "accession_number" FROM "collections")
BEGIN
    UPDATE "collections" SET "deleted" = 0 WHERE "accession_number" = NEW."accession_number";
END;

-- Create trigger to insert a new item to collections
CREATE TRIGGER "insert_when_new"
INSTEAD OF INSERT ON "current_collections"
FOR EACH ROW
WHEN NEW."accession_number" NOT IN (SELECT "accession_number" FROM "collections")
BEGIN
    INSERT INTO "collections" ("title", "accession_number", "acquired")
    VALUES (NEW."title", NEW."accession_number", NEW."acquired");
END;
