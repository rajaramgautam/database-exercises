# 1 Create a file named where_exercises.sql. Make sure to use the employees database
USE employees;


# 2 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned.
SELECT * FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

SELECT count(*) FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

# Number of Records : 709
# 3 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2?

SELECT * FROM employees
WHERE first_name = 'Irena' or first_name = 'vidya' or first_name = 'Maya';

SELECT count(*) FROM employees
WHERE first_name = 'Irena' or first_name = 'vidya' or first_name = 'Maya';

# Yes, it matches number of rows from Q2.

# 4 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.
SELECT * FROM employees
WHERE (first_name = 'Irena' or first_name = 'vidya' or first_name = 'Maya') AND gender = 'M';

SELECT COUNT(*) FROM employees
WHERE (first_name = 'Irena' or first_name = 'vidya' or first_name = 'Maya') AND gender = 'M';

 # 441

# 5 Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.
SELECT * FROM employees
WHERE last_name LIKE 'E%';

SELECT COUNT(*) FROM employees
WHERE last_name LIKE 'E%';

# 7330

# 6 Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E?
SELECT * FROM employees
WHERE last_name LIKE 'E%' OR last_name LIKE '%E';

SELECT COUNT(*) FROM employees
WHERE last_name LIKE 'E%' OR last_name LIKE '%E';

# 30723

SELECT COUNT(*) FROM employees
WHERE (NOT last_name LIKE 'E%') AND last_name LIKE '%E';

#23393


# 7 Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E?
SELECT * FROM employees
WHERE last_name LIKE 'E%' OR last_name LIKE '%E';


SELECT COUNT(*) FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E';

# 899

SELECT COUNT(*) FROM employees
WHERE last_name LIKE '%E';

# 24292


# 8 Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.
SELECT * FROM employees
WHERE hire_date between '1990-01-01' and '1999-12-31';

SELECT count(*) FROM employees
WHERE hire_date between '1990-01-01' and '1999-12-31';

# 135214

SELECT * FROM employees;

# 9 Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.

SELECT * FROM employees
WHERE birth_date like '%-12-25';

SELECT count(*) FROM employees
WHERE birth_date like '%-12-25';

# 842

SELECT * FROM employees;

# 10 Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.
SELECT * FROM employees
WHERE (hire_date between '1990-01-01' and '1999-12-31')
     and birth_date like '%-12-25';

SELECT COUNT(*) FROM employees
WHERE (hire_date between '1990-01-01' and '1999-12-31')
     and birth_date like '%-12-25';

# 362 

# 11 Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.
SELECT * FROM employees
WHERE last_name LIKE '%Q%';

SELECT COUNT(*) FROM employees
WHERE last_name LIKE '%Q%';

# 1873
# 12 Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?

SELECT * FROM employees
WHERE last_name LIKE '%Q%' AND (NOT last_name LIKE '%QU%');

SELECT COUNT(*) FROM employees
WHERE last_name LIKE '%Q%' AND (NOT last_name LIKE '%QU%');

# 547