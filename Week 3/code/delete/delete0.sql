-- Demonstrates deleting rows from a single table
-- Uses mfa.db

-- Deletes item with particular title
DELETE FROM "collections" WHERE "title" = 'Spring outing';

-- Deletes item where value is NULL
DELETE FROM "collections" WHERE "acquired" IS NULL;

-- Deletes items acquired before the museum moved to a new location in 1909
DELETE FROM "collections" WHERE "acquired" < '1909-01-01';
