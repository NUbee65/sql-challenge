/* EmployeeSQL Case Homework Query 4 */

SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM
	employees e
	INNER JOIN dept_emp de
	ON e.emp_no = de.emp_no 
	LEFT JOIN departments d
	ON de.dept_no = d.dept_no
ORDER BY
	d.dept_no ASC,
	e.last_name ASC,
	e.first_name ASC;