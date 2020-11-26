ALTER TABLE dept_emp 
ADD CONSTRAINT constraint_fk 
FOREIGN KEY (dept_no) 
REFERENCES departments (dept_no);

ALTER TABLE dept_manager 
ADD CONSTRAINT constraint_fk 
FOREIGN KEY (dept_no) 
REFERENCES departments (dept_no);

ALTER TABLE dept_emp 
ADD CONSTRAINT constraint_fk2 
FOREIGN KEY (emp_no) 
REFERENCES employees (emp_no);

ALTER TABLE dept_manager 
ADD CONSTRAINT constraint_fk2 
FOREIGN KEY (emp_no) 
REFERENCES employees (emp_no);

ALTER TABLE salaries 
ADD CONSTRAINT constraint_fk2 
FOREIGN KEY (emp_no) 
REFERENCES employees (emp_no);

ALTER TABLE employees
ADD CONSTRAINT constraint_fk3 
FOREIGN KEY (emp_title_id) 
REFERENCES titles (title_id);