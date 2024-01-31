-- Top 10 books by rating (incorrectly)
SELECT "title", "rating" FROM "longlist" ORDER BY "rating" LIMIT 10;

-- Top 10 books by rating (correctly)
SELECT "title", "rating" FROM "longlist" ORDER BY "rating" DESC LIMIT 10;

-- Ordering by more than one column
SELECT "title", "rating", "votes" FROM "longlist" 
ORDER BY "rating" DESC, "votes" DESC
LIMIT 10;

-- Ordering with a condition
SELECT "title", "rating" FROM "longlist" 
WHERE "votes" > 10000 ORDER BY "rating" DESC 
LIMIT 10;