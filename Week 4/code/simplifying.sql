-- Demonstrates views for simplifying data access
-- Uses longlist.db

-- Finds books written by Fernanda Melchor
SELECT "title" FROM "books"
WHERE "id" IN (
    SELECT "book_id" FROM "authored"
    WHERE "author_id" = (
        SELECT "id" FROM "authors"
        WHERE "name" = 'Fernanda Melchor'
    )
);

-- Joins authors with their book titles
SELECT "name", "title" FROM "authors"
JOIN "authored" ON "authors"."id" = "authored"."author_id"
JOIN "books" ON "books"."id" = "authored"."book_id";

-- Creates a view from the query to join authors with their book titles
CREATE VIEW "longlist" AS
SELECT "name", "title" FROM "authors"
JOIN "authored" ON "authors"."id" = "authored"."author_id"
JOIN "books" ON "books"."id" = "authored"."book_id";

-- Returns first five rows from view
SELECT * FROM "longlist" LIMIT 5;

-- Finds books written by Fernanda Melchor, now using a view
SELECT "title" FROM "longlist" WHERE "name" = 'Fernanda Melchor';
