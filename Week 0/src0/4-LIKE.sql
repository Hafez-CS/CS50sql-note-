-- Find all books with "love" in the title
SELECT "title" FROM "longlist" WHERE "title" LIKE '%love%';

-- Find all books that begin with "The" (includes "There", etc.)
SELECT "title" FROM "longlist" WHERE "title" LIKE 'The%';

-- Find all books that begin with "The"
SELECT "title" FROM "longlist" WHERE "title" LIKE 'The %';

-- Find a book whose title unsure how to spell
SELECT "title" FROM "longlist" WHERE "title" LIKE 'P_re';
