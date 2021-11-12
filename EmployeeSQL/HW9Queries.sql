-- QUERIES FOR DATA ANALYSIS

--Query for 3 Catergories from employees (last_name, first_name,sex, salary)((#1))
SELECT last_name, first_name, sex, salary 
FROM employees
INNER JOIN salaries
ON employees.emp_no = salaries.emp_no;


--QUERY for hiring date in 1986 (#2)
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--Query for department managers (#3)
SELECT department_managers.dept_no, dept_name, employees.emp_no, first_name, last_name 
FROM employees
INNER JOIN department_managers
ON employees.emp_no = department_managers.emp_no
INNER JOIN department
ON department.dept_no = department_managers.dept_no;

--Query for departments of all employees
SELECT employees.emp_no, first_name, last_name, dept_name
FROM employees
INNER JOIN department_employees
ON employees.emp_no = department_employees.emp_no
INNER JOIN department
ON department.dept_no = department_employees.dept_no;

--QUERY FOR HERCULES B (#5)
SELECT first_name, last_name, sex FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--Query for Sales Only  (#6)
SELECT employees.emp_no, first_name, last_name, dept_name
FROM employees
INNER JOIN department_employees
ON employees.emp_no = department_employees.emp_no
INNER JOIN department
ON department.dept_no = department_employees.dept_no
WHERE department.dept_no IN ('d007');

--Query for Sales and Delevlopment Departments (#7)
SELECT employees.emp_no, first_name, last_name, dept_name
FROM employees
INNER JOIN department_employees
ON employees.emp_no = department_employees.emp_no
INNER JOIN department
ON department.dept_no = department_employees.dept_no
WHERE department.dept_no IN ('d007', 'd005');

--Query for frequency counts of each last name (#8)
SELECT last_name, COUNT(last_name) AS "Last Name Count"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Count" DESC;

