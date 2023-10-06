-- Create the 'departments' table
CREATE TABLE departments (
    Dept_no VARCHAR(255) PRIMARY KEY NOT NULL,
    Dept_name VARCHAR(255) NOT NULL
);

SELECT * FROM departments;

-- Create the 'dept_emp' table
CREATE TABLE dept_emp (
    Emp_no INT NOT NULL,
    Dept_no VARCHAR(255) NOT NULL,
    FOREIGN KEY (Dept_no) REFERENCES departments(Dept_no)
);

SELECT * FROM dept_emp;

-- Create the 'dept_manager' table
CREATE TABLE dept_manager (
    Dept_no VARCHAR(255) NOT NULL,
    Emp_no INT PRIMARY KEY NOT NULL,
    FOREIGN KEY (Dept_no) REFERENCES departments(Dept_no)
);

SELECT * FROM dept_manager;

-- Create the 'employees' table
CREATE TABLE employees (
    Emp_no INT PRIMARY KEY NOT NULL,
    Emp_title_id VARCHAR(255) NOT NULL,
    Birth_date DATE NOT NULL,
    First_name VARCHAR(255) NOT NULL,
    Last_name VARCHAR(255) NOT NULL,
    Sex VARCHAR(10) NOT NULL,
    Hire_date DATE NOT NULL
);

SELECT * FROM employees;

-- Create the 'salaries' table
CREATE TABLE salaries (
    Emp_no INT PRIMARY KEY NOT NULL,
    Salary INT NOT NULL,
    FOREIGN KEY (Emp_no) REFERENCES employees(Emp_no)
);

SELECT * FROM salaries;

-- Create the 'titles' table
CREATE TABLE titles (
    Title_id VARCHAR(255) PRIMARY KEY NOT NULL,
    Title VARCHAR(255) NOT NULL
);

SELECT * FROM titles;


-- List the employee number, last name, first name, sex, and salary of each employee.

SELECT employees.emp_no, last_name, first_name, sex, salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM Hire_date) = 1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager dm
JOIN departments d ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_emp dm
JOIN departments d ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name, last_name, sex
FROM employees
WHERE First_name = 'Hercules' AND Last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.

SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
 
SELECT last_name, COUNT(*) as frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC, last_name;
