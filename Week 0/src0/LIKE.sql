-- Demonstrates pattern matching with LIKE
-- Uses longlist.db

-- Finds all books with "love" in the title
SELECT "title" FROM "longlist" WHERE "title" LIKE '%love%';

-- Finds all books that begin with "The" (includes "There", etc.)
SELECT "title" FROM "longlist" WHERE "title" LIKE 'The%';

-- Finds all books that begin with "The"
SELECT "title" FROM "longlist" WHERE "title" LIKE 'The %';

-- Finds a book whose title unsure how to spell
SELECT "title" FROM "longlist" WHERE "title" LIKE 'P_re';
