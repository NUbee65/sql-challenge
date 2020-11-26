/* EmployeeSQL Case Homework Query 1 */

SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
FROM
	employees e 
	FULL JOIN salaries s
	ON e.emp_no = s.emp_no
ORDER BY
	e.last_name ASC,
	e.first_name ASC;
