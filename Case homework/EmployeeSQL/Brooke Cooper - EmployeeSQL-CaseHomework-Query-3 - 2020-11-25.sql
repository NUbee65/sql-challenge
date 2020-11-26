/* EmployeeSQL Case Homework Query 3 */

SELECT
	d.dept_no,
	d.dept_name,
	dm.emp_no,
	e.last_name,
	e.first_name
FROM
	departments d
	FULL JOIN dept_manager dm
	ON d.dept_no = dm.dept_no 
	LEFT JOIN employees e
	ON dm.emp_no = e.emp_no
ORDER BY
	d.dept_no ASC,
	e.last_name ASC,
	e.first_name ASC;