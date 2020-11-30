/* Week Two - Mini Homework Question 1. SQL Joins */

-- Following creation of database "joins_example_database", import 2 csvs (X1 and X2) to create corresponding tables.
-- Also, format them using composite primary keys

DROP TABLE IF EXISTS "X1", "X2";

CREATE TABLE "X1" (
	"A" INT,
	"B" CHAR(5),
	"F" INT,
	"G" CHAR(5),
	PRIMARY KEY("A", "B")
	);

CREATE TABLE "X2" (
	"A" INT,
	"B" CHAR(5),
	"L" INT,
	"M" CHAR(5),
	PRIMARY KEY("A", "B")
	);

-- CSV import from c:\..\SQL-challenge\EmployeeSQL directory encountered problems owing to directory permissions
-- Consequently, so as not to change directory permissions (exposing to all), I copied csv files to public temp directory.

COPY "X1"("A", "B", "F", "G")
FROM 'C:\Users\Public\tmp\X1.csv'
DELIMITER ','
CSV HEADER;

COPY "X2"("A", "B", "L", "M")
FROM 'C:\Users\Public\tmp\X2.csv'
DELIMITER ','
CSV HEADER;

-- View the entire Table X1
SELECT * FROM "X1";

-- View the entire Table X2
SELECT * FROM "X2";


/* 
Below, you will find my SQL examples of the 4 basic joins.

PLEASE, PLEASE, PLEASE read my Jupyter Notebook file ("merge_joins_examples") for my discussion of the 4 basic joins.

Although I don't provide SQL code examples of 3 other join types, Self-Join, CROSS JOIN, Natural-Join, I have provided 
descriptions below:

	a) A Self-Join is a regular join that joins a table to itself using the INNER JOIN or LEFT JOIN.  
	   Self-joins are very useful to query hierarchical data or to compare rows within the same table. 
	b) CROSS JOIN allows you to make a Cartesian Product of rows in two or more tables.
	c) A NATURAL JOIN is a join that creates an implicit join based on the same column names in the joined tables.
	   You must specify whether it is to be an INNER, LEFT, or RIGHT JOIN, e.g. "NATURAL [INNER, LEFT, RIGHT] JOIN".
*/

-- INNER JOIN of 2 tables on columns A and B as keys
SELECT
	*
FROM
	"X1" as one
INNER JOIN "X2" as two
USING
	("A","B");


-- LEFT JOIN of 2 tables on columns A and B as keys
SELECT
	*
FROM
	"X1" as one
LEFT JOIN "X2" as two
USING
	("A","B");


-- RIGHT JOIN of 2 tables on columns A and B as keys
SELECT
	*
FROM
	"X1" as one
RIGHT JOIN "X2" as two
USING
	("A","B");


-- FULL JOIN of 2 tables on columns A and B as keys
SELECT
	*
FROM
	"X1" as one
FULL JOIN "X2" as two
USING
	("A","B");
