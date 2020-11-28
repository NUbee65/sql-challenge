DROP TABLE IF EXISTS employees2; 

-- Create table
CREATE TABLE employees2 (
	employee_id INT PRIMARY KEY,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	department_id INT NOT NULL);

INSERT INTO employees2 (employee_id, first_name, last_name, department_id) VALUES
    (3, 'Chris', 'Christian', 25),
	(14, 'Jan', 'Jansson', 45),
	(17, 'Sam', 'Samuels', 45);

-- Rename column
ALTER TABLE employees2
RENAME COLUMN department_id TO dept_id;

-- Add a column
ALTER TABLE employees2
ADD COLUMN annual_salary INT;

-- Add values to new column
UPDATE employees2
SET annual_salary = 250000
WHERE employee_id = 3;

UPDATE employees2
SET annual_salary = 400000
WHERE employee_id = 14;

UPDATE employees2
SET annual_salary = 60000
WHERE employee_id = 17;

-- Preview table
SELECT * FROM employees2;
