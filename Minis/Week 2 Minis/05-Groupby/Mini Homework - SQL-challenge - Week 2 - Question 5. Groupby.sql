-- Create the table "ufo_sightings", adding id as primary key
-- Note: I determined the maximum character length for the comments column in Excel <=max(len(RANGE))>
-- Owing to some issues relating to privacy, I had to copy the source csv file to a public tmp folder.
-- Good experience in having to deal with different data formats in one column, character length issues, etc.
DROP TABLE IF EXISTS ufo_sightings;

CREATE TABLE ufo_sightings (
	id SERIAL,
	datetime VARCHAR(30),
	city VARCHAR(100),
	"state" VARCHAR(10),
	country VARCHAR (10),
	shape VARCHAR (10),
	"duration (seconds)" VARCHAR (100),
	"duration (hours/min)" VARCHAR (100),
	"comments" VARCHAR (400),
	"date posted" DATE,
	"latitude" VARCHAR(40),
	"longitude" VARCHAR(40),
	PRIMARY KEY(id)
	);

-- Import csv file and populate its data into the database table
COPY ufo_sightings(
	datetime,
	city,
	"state",
	country,
	shape,
	"duration (seconds)",
	"duration (hours/min)",
	"comments",
	"date posted",
	"latitude",
	"longitude")
FROM 'C:\Users\Public\tmp\ufoSightings.csv'
DELIMITER ','
CSV HEADER;

-- Preview first 5 rows of table
SELECT * FROM ufo_sightings FETCH FIRST 5 ROW ONLY;

-- Delete records (rows) where duration in seconds is not expressed numerically
-- 265 rows were deleted as a result
DELETE FROM ufo_sightings where ("duration (seconds)" !~ '^[0-9]+$');

-- Change the data type of the column "duration (seconds)" from CHARVAR to INT
ALTER TABLE ufo_sightings
ALTER COLUMN "duration (seconds)" SET DATA TYPE INT
USING "duration (seconds)"::integer;

-- Scan return values for unique states
SELECT DISTINCT state
FROM ufo_sightings
WHERE "country" = 'us'
	AND "state" IS NOT NULL;

-- Query for the total duration (in seconds) of UFO sightings by state, respectively
-- The returns checked out against the python pandas returns.
SELECT
	"state",
	SUM ("duration (seconds)")
FROM
	ufo_sightings
WHERE
	"country" = 'us'
	AND "state" IS NOT NULL
GROUP BY
	"state"
ORDER BY
	"state";

-- Query for the average duration (in seconds) of UFO sightings by state, respectively
SELECT
	"state",
	AVG ("duration (seconds)")
FROM
	ufo_sightings
WHERE
	"country" = 'us'
	AND "state" IS NOT NULL
GROUP BY
	"state"
ORDER BY
	"state";





