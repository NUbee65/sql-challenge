/* Week Two - Mini Homework Question 4. Duplicates */

-- Create the table "vendors" with two sets of duplicate rows (excepting id) and identify PK
DROP TABLE IF EXISTS yarns;

CREATE TABLE yarns (
	id SERIAL,
	yarn_name VARCHAR(30),
	yarn_type VARCHAR(30),
	grams INT,
	color INT,
	lot INT,
	qty INT,
	vendor_id INT,
	PRIMARY KEY(id)
	);

-- Populate data into yearns table
INSERT INTO yarns (id, yarn_name, yarn_type, grams, color, lot, qty, vendor_id) VALUES
    (1, 'Merino Supreme', 'Worsted', 50, 8, 76123, 1, 1),
	(2, 'Cartwheel', 'Bulky', 200, 2, 1801, 2, 2),
	(3, 'Paloma Tweed', 'Super Bulky', 50, 42513, 63978, 2, 3),
	(4, 'Heritage', 'Sock', 100, 5640, 1707058, 1, 2),
	(5, 'Heritage', 'Sock', 100, 5640, 1707058, 1, 2),
	(6, 'Cartwheel', 'Bulky', 200, 2, 1801, 2, 2);

-- View the entire yarns table
SELECT * FROM yarns;

-- METHODS USING MULTIPLE FIELDS TO IDENTIFY, FILTER, AND/OR DELETE DUPLICATE ROWS (EXCLUDING id)

/* 
Single Field Method 1.
* Selected yarn_name field because they are unique in the "yarn" table data set.  Note however:
	* This would fail if two vendors offered yarns with the same name.
	* Likewise, if the same vendor offered variants with different specs under the same yarn name.
* Returns all duplicate rows.  Does not delete.  Does not persist results.
* Using this method might help you decide which rows to delete based on order preference. 
* In this differencing method, we aliased the table twice as "y1" and "y2".
*/

select * from yarns y1
where (select count(*) from yarns y2
where y1.yarn_name = y2.yarn_name) > 1
order by id
	
SELECT * FROM yarns;

/*
Single Field Method 2. 
* Delete (PERSISTENTLY) the duplicate rows.
* Selected yarn_name field because they are unique in the "yarn" table data set.
	* Same field selection caveats as in Single Field Method 1 above.
* In this differencing method, we aliased the table twice as "y1" and "y2".
* This method also deletes the duplicate record with the higher id value.
*/

DELETE FROM yarns AS y1  
USING yarns AS y2
WHERE y1.id > y2.id
   AND y1.yarn_name = y2.yarn_name;

SELECT * FROM yarns;

-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------

/* 
Multiple Fields Method 1. 
* Filters out duplicate rows.  BUT NOT PERSISTENT!
* This method apparently does not allow sorting results using ORDED BY. 
*/

SELECT DISTINCT 
	ON (yarn_name, yarn_type, grams, color, lot, qty, vendor_id) * 
FROM 
	yarns y;

SELECT * FROM yarns;

/* 
Multiple Fields Method 2. 
* Delete (the duplicate rows. NOT PERSISTENTLY!
* Another example of a subquery methodology
* PARTITION BY divides into groups and ORDER BY sorts them by descending order.
	* the fields listed do not include id
	* elsewhere in the query, they do include id
* ROW_NUMBER() assigns an integer number to every row in each category.
* Choosing the first row number (equals 1) selects one record to keep.
* We have to alias the query in brackets; we chose "tmp". 
*/

SELECT
	id, yarn_name, yarn_type, grams, color, lot, qty, vendor_id
	FROM
		(
		SELECT id, yarn_name, yarn_type, grams, color, lot, qty, vendor_id, ROW_NUMBER() OVER
			(PARTITION BY (yarn_name, yarn_type, grams, color, lot, qty, vendor_id)
			ORDER BY id ASC) rn
		FROM yarns
		) tmp 
	WHERE rn = 1
ORDER BY
	id ASC;
	
SELECT * FROM yarns;

/*
Multiple Fields Method 3. 
* Delete (PERSISTENTLY) the duplicate rows.
* In this differencing method, we aliased the table twice as "y1" and "y2".
* This method also deletes the duplicate record with the higher id value.
*/

DELETE FROM yarns AS y1  
USING yarns AS y2
WHERE y1.id > y2.id
   AND y1.yarn_name = y2.yarn_name  
   AND y1.yarn_type = y2.yarn_type
   AND y1.grams = y2.grams
   AND y1.color = y2.color
   AND y1.lot = y2.lot
   AND y1.qty = y2.qty
   AND y1.vendor_id = y2.vendor_id;

SELECT * FROM yarns;

/* 
Multiple Fields Method 4. 
* Delete (PERSISTENTLY) the duplicate rows.
* This method deletes the rows corresponding to the id values extracted by the bracketed subquery.
* We have to alias the query in brackets; we chose "foo".
*/ 

DELETE FROM yarns WHERE yarns.id NOT IN
(SELECT id FROM (
	SELECT DISTINCT ON (yarn_name, yarn_type, grams, color, lot, qty, vendor_id) *
	FROM yarns
	) AS foo
);

SELECT * FROM yarns;

/* 
Multiple Fields Method 5. 
* Delete (PERSISTENTLY) the duplicate rows.
* This method deletes the rows corresponding to the id values NOT extracted by the aliased subquery.
* We aliased the query in brackets as "unique_rows".
*/

WITH unique_rows AS 
	(SELECT DISTINCT ON (yarn_name, yarn_type, grams, color, lot, qty, vendor_id) * 
	 FROM yarns)
DELETE FROM yarns WHERE yarns.id NOT IN (SELECT id FROM unique_rows);

SELECT * FROM yarns;



-- Multiple Fields Method X. Delete (persistently) the duplicate rows.
SELECT (yarns.*)::text, COUNT(*)
FROM yarns
GROUP BY yarns.*
HAVING COUNT(*) > 1

select * from yarns y1
where (select count(*) from yarns y2
where y1.yarn_name = y2.yarn_name) > 1
order by id