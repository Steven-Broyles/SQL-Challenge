-- Titles-> Employees-> Departments->Dept Manager-> Dept Employee->Salaries
--Create schema for table creation
DROP TABLE IF EXISTS titles CASCADE;

CREATE TABLE Titles (title_id VARCHAR PRIMARY KEY, titles VARCHAR);

DROP TABLE IF EXISTS Employees CASCADE;	

CREATE TABLE Employees(
emp_no INT PRIMARY KEY, 
emp_title_id VARCHAR,
birth_date DATE, 
first_name VARCHAR,
last_name VARCHAR,
sex VARCHAR,
hire_date DATE,
Foreign KEY (emp_title_id) REFERENCES titles(title_id)
	);

DROP TABLE IF EXISTS department CASCADE ;

CREATE TABLE department (dept_no VARCHAR PRIMARY KEY, dept_name VARCHAR);

DROP TABLE IF EXISTS department_managers CASCADE;

CREATE TABLE department_managers(dept_no VARCHAR, emp_no INT, 
								 FOREIGN KEY (dept_no) REFERENCES department(dept_no), FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
								PRIMARY KEY (dept_no, emp_no));

DROP TABLE IF EXISTS department_employees CASCADE;								

CREATE TABLE department_employees(emp_no INT, dept_no VARCHAR, 
								 FOREIGN KEY (dept_no) REFERENCES department(dept_no), FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
								PRIMARY KEY (emp_no, dept_no));

DROP TABLE IF EXISTS salaries CASCADE;

CREATE TABLE salaries (emp_no INT PRIMARY KEY, salary INT, FOREIGN KEY (emp_no) REFERENCES employees(emp_no));

