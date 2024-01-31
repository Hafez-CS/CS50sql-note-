-- Look at examples of dates
SELECT "title", "published" FROM "longlist";

-- Books published in the summer of 2022 (for the northern hemisphere)
SELECT "title", "published" FROM "longlist" WHERE "published" BETWEEN date('2022-05-01') AND date('2022-08-01');
