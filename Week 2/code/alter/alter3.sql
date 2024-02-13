-- Demonstrates renaming a column
-- Uses mbta.db

-- Fixes typo using RENAME COLUMN
ALTER TABLE "swipes" RENAME COLUMN "ttpe" TO "type";
