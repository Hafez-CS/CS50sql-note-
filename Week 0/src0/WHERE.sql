-- Demonstrates filtering with WHERE
-- Uses longlist.db

-- Selects all books (titles and authors) nominated in 2023
SELECT "title", "author" FROM "longlist" WHERE "year" = 2023;

-- Selects all books by Fernanda Melchor
SELECT "title", "author" FROM "longlist" WHERE "author" = 'Fernanda Melchor';

-- Selects all books not released in hardcover format
SELECT "title", "format" FROM "longlist" WHERE "format" != 'hardcover';

-- Selects all books not released in hardcover format
SELECT "title", "format" FROM "longlist" WHERE "format" <> 'hardcover';

-- Selects all books not released in hardcover format
SELECT "title", "format" FROM "longlist" WHERE NOT "format" = 'hardcover';
