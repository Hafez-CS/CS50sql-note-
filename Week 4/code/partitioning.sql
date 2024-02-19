-- Demonstrates views for partitioning data
-- Uses longlist.db

-- Queries for 2022 longlisted books
SELECT "id", "title" FROM "books"
WHERE "year" = 2022;

-- Creates view of 2022 longlisted books
CREATE VIEW "2022" AS
SELECT "id", "title" FROM "books"
WHERE "year" = 2022;

-- Queries for 2021 longlisted books
SELECT "id", "title" FROM "books"
WHERE "year" = 2021;

-- Creates view of 2021 longlisted books
CREATE VIEW "2021" AS
SELECT "id", "title" FROM "books"
WHERE "year" = 2021;
