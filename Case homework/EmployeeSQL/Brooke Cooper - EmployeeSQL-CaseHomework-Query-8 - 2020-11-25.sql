/* EmployeeSQL Case Homework Query 8 */

SELECT
	e.last_name,
	COUNT(e.last_name)
FROM
	employees e
GROUP BY
	e.last_name
ORDER BY
	COUNT(e.last_name) DESC;

