
--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no AS "Employee Number",
	employees.last_name AS "Last Name",
	employees.first_name AS "First Name",
	employees.sex As "Sex",
	salaries.salary As "Salary"
FROM employees
INNER JOIN salaries on salaries.emp_no = employees.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT employees.first_name AS "First Name",
	   employees.last_name AS "Last Name",
	   employees.hire_date AS "Hire Date"
From employees
WHERE hire_date between '1/1/1986' AND '12/31/1986';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dept_manager.dept_no AS "Department Number",
	departments.dept_no AS "Department Name",
	dept_manager.emp_no AS "Manager Employee Number",
	dept_manager.dept_no AS "Department Number",	
	employees.last_name AS "Last Name",
	employees.first_name AS "First Name"
FROM employees
INNER JOIN dept_manager on dept_manager.emp_no = employees.emp_no
INNER JOIN departments on departments.dept_no = departments.dept_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no AS "Employee Number",
	employees.last_name AS "Last Name",
	employees.first_name AS "First Name",
	departments.dept_name AS "Department Name"
FROM employees
INNER JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name AS "First Name",
	employees.last_name AS "Last Name",
	employees.sex As "Sex"
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name Like '%B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no AS "Employee Number",
	employees.last_name AS "Last Name",
	employees.first_name AS "First Name",
	departments.dept_name AS "Department Name"
FROM employees
INNER JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no AS "Employee Number",
	employees.last_name AS "Last Name",
	employees.first_name AS "First Name",
	departments.dept_name AS "Department Name"
FROM employees
INNER JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
WHERE departments.dept_name in ('Sales', 'Development');

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT (*) AS "Total Employees" FROM employees
GROUP BY last_name
ORDER BY "Total Employees" desc;