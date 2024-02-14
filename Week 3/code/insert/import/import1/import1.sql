-- Import into an existing table using a CSV without primary keys

.import --csv mfa.csv temp

INSERT INTO "collections" ("title", "accession_number", "acquired") 
SELECT "title", "accession_number", "acquired" FROM "temp";

DROP TABLE "temp";