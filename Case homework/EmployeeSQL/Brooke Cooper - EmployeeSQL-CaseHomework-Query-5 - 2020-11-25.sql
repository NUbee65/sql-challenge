/* EmployeeSQL Case Homework Query 5 */

SELECT
	e.first_name,
	e.last_name,
	e.sex
FROM
	employees e
WHERE
	e.first_name = 'Hercules'
	AND e.last_name LIKE 'B%'
ORDER BY
	e.last_name ASC,
	e.first_name ASC;
	
	
	
