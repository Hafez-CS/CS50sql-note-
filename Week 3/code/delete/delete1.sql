-- Demonstrates deleting rows with constraints
-- Uses mfa.db

-- Raises a foreign key constraint error
DELETE FROM "artists" WHERE "name" = 'Unidentified artist';

-- Deletes the artist's affiliation with their work, using hard-coded id
DELETE FROM "created" WHERE "artist_id" = 3;

-- Deletes the artist's affiliation with their work, using subquery
DELETE FROM "created" WHERE "artist_id" = (
    SELECT "id" FROM "artists" WHERE "name" = 'Unidentified artist'
);

-- Deletes the artist themselves
DELETE FROM "artists" WHERE "name" = 'Unidentified artist';
