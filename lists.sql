
-- 1. employee number, last name, first name, gender, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender,salaries.salary
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no
ORDER BY salaries.salary DESC;

-- 2. employees who were hired in 1986.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender
FROM employees
WHERE date_part('year',hire_date) = 1986
ORDER BY employeees.hire_date DESC;

-- 3. the manager list with department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date  
FROM dept_manager
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON dept_manager.emp_no = employees.emp_no
ORDER BY departments.dept_name DESC;


-- 4. the department with employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
INNER JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
ORDER BY employees.last_name DESC;

-- 5. employees whose first name is "Hercules" and last names begin with "B."

SELECT employees.first_name, employees.last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6.  employees in the Sales department 

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
INNER JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
WHERE departments.dept_name='Sales'
ORDER BY employees.last_name DESC;

-- 7. employees in the Sales and Development departments
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
INNER JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'
ORDER BY employees.last_name DESC;

-- 8 . List the frequency count of employee last names in descneding order

SELECT employees.last_name, COUNT(employees.last_name) FROM employees
GROUP BY employees.last_name
ORDER BY COUNT DESC;