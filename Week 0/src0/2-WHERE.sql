-- Select all books nominated in 2023
SELECT "title", "author" FROM "longlist" WHERE "year" = 2023;

-- Prove selected only books nominated in 2023
SELECT "title", "year" FROM "longlist" WHERE "year" = 2023;

-- Select all books by Fernanda Melchor
SELECT "title", "author" FROM "longlist" WHERE "author" = 'Fernanda Melchor';

-- Select all books not released in hardcover format
SELECT "title", "format" FROM "longlist" WHERE "format" != 'hardcover';

-- Select all books not released in hardcover format
SELECT "title", "format" FROM "longlist" WHERE "format" <> 'hardcover';

-- Select all books not released in hardcover format
SELECT "title", "format" FROM "longlist" WHERE NOT "format" = 'hardcover';