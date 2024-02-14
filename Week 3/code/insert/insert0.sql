-- Demonstrates adding individual rows to a table
-- Uses mfa.db

-- Adds a new item to the collections
INSERT INTO "collections" ("id", "title", "accession_number", "acquired")
VALUES (1, 'Profusion of flowers', '56.257', '1956-04-12');

-- Adds a new item to the collections
INSERT INTO "collections" ("id", "title", "accession_number", "acquired")
VALUES (2, 'Farmers working at dawn', '11.6152', '1911-08-03');

-- Adds a new item to the collections, demonstrating primary key auto-increments
INSERT INTO "collections" ("title", "accession_number", "acquired")
VALUES ('Spring outing', '14.76', '1914-01-08');

-- Shows violation of UNIQUE
INSERT INTO "collections" ("title", "accession_number", "acquired")
VALUES ('Spring outing', '14.76', '1914-01-08');

-- Shows violation of NOT NULL
INSERT INTO "collections" ("title", "accession_number", "acquired")
VALUES (NULL, '56.496', '1914-01-08');

-- Profusion of flowers: https://collections.mfa.org/objects/254/profusion-of-flowers?ctx=59408041-a021-4b91-bceb-580fd6fe7e17&idx=5
-- Farmers working at dawn: https://collections.mfa.org/objects/256/farmers-working-at-dawn?ctx=59408041-a021-4b91-bceb-580fd6fe7e17&idx=7
-- Spring outing: https://collections.mfa.org/objects/353/spring-outing?ctx=87931f50-caf4-4309-8175-96c5196e52bb&idx=23
