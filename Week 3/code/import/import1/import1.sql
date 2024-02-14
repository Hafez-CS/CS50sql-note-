-- Demonstrates importing a CSV into an existing table and adding primary keys
-- Creates mfa.db

-- Deletes prior tables if they exist
DROP TABLE IF EXISTS "collections";
DROP TABLE IF EXISTS "artists";
DROP TABLE IF EXISTS "created";

-- Imports into a temporary using a CSV without primary keys
.import --csv mfa.csv temp

-- Creates a final table to store imported data
CREATE TABLE "collections" IF NOT EXISTS (
    "id" INTEGER,
    "title" TEXT NOT NULL,
    "accession_number" TEXT NOT NULL UNIQUE,
    "acquired" NUMERIC,
    PRIMARY KEY("id")
);

-- Inserts into final table by selecting from temporary table
INSERT INTO "collections" ("title", "accession_number", "acquired") 
SELECT "title", "accession_number", "acquired" FROM "temp";

-- Deletes temporary table
DROP TABLE "temp";
