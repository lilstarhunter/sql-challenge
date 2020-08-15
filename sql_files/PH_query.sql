--1. List the following details of each employee: 
	--employee number, last name, first name, sex, and salary.
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
FROM employees as e
JOIN salaries as s
ON e.emp_no = s.emp_no

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name,
	last_name,
	hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986

--3.List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
SELECT m.dept_no,
	d.dept_name,
	m.emp_no,
	e.last_name,
	e.first_name
FROM employees as e
JOIN dept_manager as m
ON e.emp_no = m.emp_no
JOIN department as d
ON d.dept_no = m.dept_no;

--#When importing data made emp_no var_char and no integer therefore couldnt join
--ALTER TABLE dept_manager
--ALTER COLUMN emp_no TYPE INT USING emp_no::integer


--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no,
		e.last_name,
		e.first_name,
		de.dept_name
FROM employees as e
JOIN dept_emp as d
ON d.emp_no = e.emp_no
JOIN department as de
ON de.dept_no = d.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name,
	last_name,
	sex
FROM employees
WHERE last_name LIKE 'B%'
AND first_name = 'Hercules';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	de.dept_name
FROM employees as e
JOIN dept_emp as d
ON d.emp_no = e.emp_no
JOIN department as de
ON de.dept_no = d.dept_no
WHERE de.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	de.dept_name
FROM employees as e
JOIN dept_emp as d
ON d.emp_no = e.emp_no
JOIN department as de
ON de.dept_no = d.dept_no
WHERE de.dept_name = 'Sales'
OR de.dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
	count(last_name) AS name_frequency
FROM employees
GROUP BY last_name
ORDER BY name_frequency DESC;

