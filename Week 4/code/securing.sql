-- Demonstrates views for securing data
-- Uses rideshare.db

CREATE TABLE "rides" (
    "id" INTEGER,
    "origin" TEXT NOT NULL,
    "destination" INTEGER NOT NULL,
    "rider" TEXT NOT NULL,
    PRIMARY KEY("id")
);

INSERT INTO "rides" ("origin", "destination", "rider")
VALUES
('Good Egg Galaxy', 'Honeyhive Galaxy', 'Peach'),
('Castle Courtyard', 'Cascade Kingdom', 'Mario'),
('Metro Kingdom', 'Mushroom Kingdom', 'Luigi'),
('Seaside Kingdom', 'Deep Woods', 'Bowser');

-- Reveals all rides information
SELECT * FROM "rides";

-- Reveals only subset of columns
SELECT "id", "origin", "destination" FROM "rides";

-- Makes clear that rider is anonymous
SELECT "id", "origin", "destination", 'Anonymous' AS "rider" FROM "rides";

-- Creates a view
CREATE VIEW "analysis" AS
SELECT "id", "origin", "destination", 'Anonymous' AS "rider" FROM "rides";

-- Queries the view
SELECT "origin", "destination", "rider" FROM "analysis";
