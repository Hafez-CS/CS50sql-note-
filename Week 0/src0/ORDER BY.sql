-- Demonstrates sorting with ORDER BY
-- Uses longlist.db

-- Finds top 10 books by rating (incorrectly)
SELECT "title", "rating" FROM "longlist" ORDER BY "rating" LIMIT 10;

-- Finds top 10 books by rating (correctly)
SELECT "title", "rating" FROM "longlist" ORDER BY "rating" DESC LIMIT 10;

-- Sorts by more than one column
SELECT "title", "rating", "votes" FROM "longlist" 
ORDER BY "rating" DESC, "votes" DESC
LIMIT 10;

-- Sorts with a condition
SELECT "title", "rating" FROM "longlist" 
WHERE "votes" > 10000 ORDER BY "rating" DESC 
LIMIT 10;
