-- Demonstrates updating authorship
-- Uses mfa.db

-- Updates authorship (incorrectly)
UPDATE "created" SET "artist_id" = (
    SELECT "id" FROM "artists"
    WHERE "name" = 'Li Yin'
);

-- Updates authorship (correctly) for a piece with a previously unknown authorship
UPDATE "created" SET "artist_id" = (
    SELECT "id" FROM "artists"
    WHERE "name" = 'Li Yin'
)
WHERE "collection_id" = (
    SELECT "id" FROM "collections"
    WHERE "title" = 'Farmers working at dawn'
);
