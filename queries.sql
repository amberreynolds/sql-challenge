-- SELECT * FROM public."Dept_manager";

-- select * FROM public."Employees"
-- 	left join public."Salaries" on public."Employees".emp_no = public."Salaries".emp_no;
	
-- SELECT 
-- 	employees.emp_no AS ID,
-- 	salaries.salary AS MY_PAY
-- FROM PUBLIC."Employees" employees
-- 	LEFT JOIN PUBLIC."Salaries" salaries on salaries.emp_no = employees.emp_no;
	

-- 	List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT 
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM PUBLIC."Employees" employees
	LEFT JOIN PUBLIC."Salaries" salaries on salaries.emp_no = employees.emp_no;
	
-- List first name, last name, and hire date for employees who were hired in 1986.

SELECT 
	employees.first_name,
	employees.last_name,
	employees.hire_date
FROM PUBLIC."Employees" employees WHERE EXTRACT(year FROM employees.hire_date) = 1986;

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT
	dept_manager.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	employees.last_name,
	employees.first_name
FROM PUBLIC."Dept_manager" dept_manager
	LEFT JOIN PUBLIC."Departments" departments on departments.dept_no = dept_manager.dept_no
	LEFT JOIN PUBLIC."Employees" employees on employees.emp_no = dept_manager.emp_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.

-- I left the duplicate values because there was no way to drop them and ensure the data presented is current/correct. There was only one record per employee
-- on the employees table, while there were duplicate records on the dept_emp

SELECT
	dept_emp.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM PUBLIC."Dept_emp" dept_emp
	LEFT JOIN PUBLIC."Departments" departments on departments.dept_no = dept_emp.dept_no
	LEFT JOIN PUBLIC."Employees" employees on employees.emp_no = dept_emp.emp_no
ORDER BY dept_emp.emp_no;
	
-- SELECT * FROM PUBLIC."Employees" employees
-- 	LEFT OUTER JOIN PUBLIC."Dept_emp" dept_emp on employees.emp_no = dept_emp.emp_no
	
-- SELECT * FROM PUBLIC."Dept_emp" dept_emp
-- 	LEFT JOIN PUBLIC."Departments" departments on dept_emp.dept_no = departments.dept_no

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT 
	employees.first_name,
	employees.last_name,
	employees.sex
FROM PUBLIC."Employees" employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT
	dept_emp.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM PUBLIC."Dept_emp" dept_emp
	LEFT JOIN PUBLIC."Departments" departments on departments.dept_no = dept_emp.dept_no
	LEFT JOIN PUBLIC."Employees" employees on employees.emp_no = dept_emp.emp_no
WHERE departments.dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT
	dept_emp.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM PUBLIC."Dept_emp" dept_emp
	LEFT JOIN PUBLIC."Departments" departments on departments.dept_no = dept_emp.dept_no
	LEFT JOIN PUBLIC."Employees" employees on employees.emp_no = dept_emp.emp_no
WHERE departments.dept_name IN ('Sales', 'Development');

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT
	last_name,
	COUNT(last_name) AS lastname_count
	FROM PUBLIC."Employees"
GROUP BY last_name
ORDER BY lastname_count DESC;

