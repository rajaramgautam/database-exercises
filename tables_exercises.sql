-- Using employees data
USE employees;

-- List all the tables in the Database

Show tables;

-- Explore the employees table

DESCRIBE current_dept_emp;
DESCRIBE departments;
DESCRIBE dept_emp;
DESCRIBE dept_emp_latest_date;
DESCRIBE dept_manager;
DESCRIBE employees;
DESCRIBE salaries;
DESCRIBE titles;



-- Which table(s) do you think contain a numeric type column?
-- Answer: current_dept_emp, dept_emp, dept_emp_latest_date, dept_manager, employees; salaries, titles

-- Which table(s) do you think contain a string type column?
-- Answer: Except dept_emp_latest_date, salaries

-- Which table(s) do you think contain a date type column?
-- Answer: current_dept_emp, dept_emp, dept_emp_latest_date, dept_manager, employees, salaries, titles

-- What is the relationship between the employees and the departments tables?
-- Answer: Looking on table structure there is none. But each employees will belong to department in most case. If employee has department_id, it would be better to analyze the relationship.

-- Show the SQL that created the dept_manager table.
SHOW CREATE TABLE dept_manager;

