/* Week Two - Mini Homework Question 3. DML & DDL */

-- Create table "vendors" and identify PK
DROP TABLE IF EXISTS vendors, yarns;

CREATE TABLE vendors (
	id SERIAL,
	vendor_name VARCHAR(30),
	vendor_country VARCHAR(30),
	PRIMARY KEY(id)
	);

-- Populate data into vendors table
INSERT INTO vendors (id, vendor_name, vendor_country) VALUES
    (1, 'Carlton', 'Turkey'),
	(2, 'Cascade Yarns', 'United States'),
	(3, 'Debbie Bliss', 'United Kingdom'),
	(4, 'Tahki', 'Greece');

-- View the entire table
SELECT * FROM vendors;

-- create second table "yarns" and identify PK and FK
CREATE TABLE yarns (
	id SERIAL,
	yarn_name VARCHAR(30) UNIQUE,
	yarn_type VARCHAR(30),
	grams INT,
	color INT,
	lot INT,
	qty INT,
	vendor_id INT,
	PRIMARY KEY(id),
	CONSTRAINT fk_yarns
      FOREIGN KEY(vendor_id) 
	  REFERENCES vendors(id)
	);

-- Populate data into yearns table
INSERT INTO yarns (id, yarn_name, yarn_type, grams, color, lot, qty, vendor_id) VALUES
    (1, 'Merino Supreme', 'Worsted', 50, 8, 76123, 1, 1),
	(2, 'Cartwheel', 'Bulky', 200, 2, 1801, 2, 2),
	(3, 'Paloma Tweed', 'Super Bulky', 50, 42513, 63978, 2, 3),
	(4, 'Heritage', 'Sock', 100, 5640, 1707058, 1, 2);

-- View the entire yarns table
SELECT * FROM yarns;

/* 
Below, we joined the 2 tables and filtered for 4 columns (vendor_name, vendor_country, yarn_name, yarn_type)
a. The code below proves that a LEFT JOIN can delivere the output in Question 1. SQL Joins
b. Substituting FULL JOIN for LEFT JOIN also proves that a FULL JOIN delivers the output in Question 1. SQL Joins
This is exactly as we had said in our answer to that question.  Two types of Joins deliver that output.
*/

SELECT
	v.vendor_name,
	v.vendor_country,
	y.yarn_name,
	y.yarn_type
FROM vendors v
FULL JOIN yarns y
ON v.id = y.vendor_id;

-- We added a new record into the yarns table
INSERT INTO yarns (id, yarn_name, yarn_type, grams, color, lot, qty, vendor_id) VALUES
    (5, 'Thermax', 'Sport', 50, 24, 14376, 7, 4);

SELECT * FROM yarns;

-- We then updated the recently added record in the yarns table
UPDATE yarns SET vendor_id = 2
  WHERE id = 5;

SELECT * FROM yarns;

-- We then deleted row 5 (recently added) from the table yarns
DELETE FROM yarns WHERE id = 5;

SELECT * FROM yarns;

/* 
We used UPSERT function to add two rows to the yarn table.  Each yarn was from the same vendor (vendor_id 4, vendor_name Tahki).
One yarn already existed in the table but was previously listed from a different vendor (vendor_id 2, vendor_name Cascade Yarns)
So, that row was effectively no change, except for the vendor.  Effectively, we're calling for an update to the table.
The other yarn is new to the table.  Effectively, we're callling for an insert (addition) to the table.
The UPSERT function is accomplished by combining the INSERT INTO operator with ON CONFLICT and DO operators.
*/

INSERT INTO 
    yarns (id, yarn_name, yarn_type, grams, color, lot, qty, vendor_id)
VALUES
    (4, 'Heritage', 'Sock', 100, 5640, 1707058, 1, 4),
	(5, 'Thermax', 'Sport', 50, 24, 14376, 7, 4)
ON CONFLICT ON CONSTRAINT yarns_pkey
DO 
	UPDATE SET vendor_id = EXCLUDED.vendor_id;

SELECT * FROM yarns;
