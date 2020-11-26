/* EmployeeSQL Case Homework Query 2 */

SELECT
	e.first_name,
	e.last_name,
	e.hire_date
FROM
	employees e 
WHERE
	hire_date >= '1986-01-01'
	AND hire_date <= '1986-12-31'
ORDER BY
	e.last_name ASC,
	e.first_name ASC;
