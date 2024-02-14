-- Demonstrates deleting rows with ON DELETE actions
-- Uses mfa.db

-- Deletes an artist when foreign key ON DELETE action is set to CASCADE
DELETE FROM "artists" WHERE "name" = 'Unidentified artist';
