-- Demonstrates cleaning data from a CSV of votes for favorite artwork
-- Creates votes.db

-- Imports votes.csv
.import votes.csv votes

-- Counts votes
SELECT "title", COUNT("title") FROM "votes" GROUP BY "title";

-- Removes trailing whitespace
UPDATE "votes" SET "title" = trim("title");

-- Forces to uppercase
UPDATE "votes" SET "title" = upper("title");

-- Manually updates the titles of "Farmers working at dawn"
UPDATE "votes" SET "title" = 'FARMERS WORKING AT DAWN'
WHERE "title" = 'FARMERS WORKING';

UPDATE "votes" SET "title" = 'FARMERS WORKING AT DAWN'
WHERE "title" = 'FAMERS WORKING AT DAWN';

-- Fixes misspellings of "Farmers working at dawn"
UPDATE "votes" SET "title" = 'FARMERS WORKING AT DAWN'
WHERE "title" LIKE 'Fa%';

-- Fixes misspellings of "Imaginative landscape"
UPDATE "votes" SET "title" = 'IMAGINATIVE LANDSCAPE'
WHERE "title" LIKE 'Imag%';

-- Fixes misspellings of "Profusion of flowers"
UPDATE "votes" SET "title" = 'PROFUSION OF FLOWERS'
WHERE "title" LIKE 'Profusion %';
