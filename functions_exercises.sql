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


 # 1 Create a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson.
  -- Ans.: - A file named order_by_exercises.sql has been created abd copying of contents as requested has been performed.

 # 2 Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
 SELECT * FROM employees
 WHERE first_name IN ('Irena', 'Vidya', 'Maya')
 ORDER BY first_name;

 /*
 First Row: Irena Reutenauer
 Last Row: Vidya Simmen

 */


 # 3 Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
 SELECT * FROM employees
 WHERE first_name IN ('Irena', 'Vidya', 'Maya')
 ORDER BY first_name, last_name;
 /*
 First Row: Irena Acton
 Last Row: Vidya Zweizig

 */

 # 4 Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
 SELECT * FROM employees
 WHERE first_name IN ('Irena', 'Vidya', 'Maya')
 ORDER BY last_name, first_name;
 /*
 First Row: Irena Acton
 Last Row:  Maya Zyda

 */

 # 5 Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.
 SELECT * FROM employees
 WHERE last_name LIKE 'E%' and last_name LIKE '%E'
 ORDER BY emp_no;

 SELECT count(*) FROM employees
 WHERE last_name LIKE 'E%' and last_name LIKE '%E'
 ORDER BY emp_no;
 /*
 899
 First Row: Irena Acton
 Last Row:  Maya Zyda

 */

 # 6 Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest emmployee.
 SELECT * FROM employees
 WHERE last_name LIKE 'E%' and last_name LIKE '%E'
 ORDER BY hire_date desc;

 SELECT count(*) FROM employees
 WHERE last_name LIKE 'E%' and last_name LIKE '%E'
 ORDER BY hire_date desc;

 /*
 899
 First Row: Teiji Eldridge
 Last Row:  Sergi Erde

 */

 # 7 Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest emmployee who was hired first.
 SELECT * FROM employees
 WHERE (hire_date between '1990-01-01' and '1999-12-31')
      and birth_date like '%-12-25'
      order by hire_date;

 SELECT count(*) FROM employees
 WHERE (hire_date between '1990-01-01' and '1999-12-31')
      and birth_date like '%-12-25'
      order by hire_date;

 /*
 362
 First Row: Aselmn Cappello
 Last Row: Khun Bernini
*/

# 1. Copy the order by exercise and save it as functions_exercises.sql.
-- Ans.: - Performed.

# 2 Write a query to to find all employees whose last name starts and ends with 'E'. Use concat() to combine their first and last name together as a single column named full_name.
 SELECT concat(first_name, ' ' ,last_name) as Full_Name FROM employees
 WHERE last_name LIKE 'E%' and last_name LIKE '%E';


# 3. Convert the names produced in your last query to all uppercase.
SELECT upper(concat(first_name, ' ' ,last_name)) as Full_Name_Upper FROM employees
 WHERE last_name LIKE 'E%' and last_name LIKE '%E';


# 4. Find all employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE()),

 SELECT datediff(curdate(), hire_date) as DAYS_IN_OFFICE FROM employees
 WHERE (hire_date between '1990-01-01' and '1999-12-31')
      and birth_date like '%-12-25';

# 5. Find the smallest and largest current salary from the salaries table.

SELECT min(salary) as smallest_salary, max(salary) as largest_salary FROM salaries;
# 6. Use your knowledge of built in SQL functions to generate a username for all of the employees. A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born. Below is an example of what the first 10 rows will look like:

select concat(substr(lower(first_name), 1, 1), substr(lower(last_name), 1, 4), substr(birth_date, 6, 2), substr(birth_date, 3, 2))      as username,
first_name, last_name, birth_date from employees;



+------------+------------+-----------+------------+
| username   | first_name | last_name | birth_date |
+------------+------------+-----------+------------+
| gface_0953 | Georgi     | Facello   | 1953-09-02 |
| bsimm_0664 | Bezalel    | Simmel    | 1964-06-02 |
| pbamf_1259 | Parto      | Bamford   | 1959-12-03 |
| ckobl_0554 | Chirstian  | Koblick   | 1954-05-01 |
| kmali_0155 | Kyoichi    | Maliniak  | 1955-01-21 |
| apreu_0453 | Anneke     | Preusig   | 1953-04-20 |
| tziel_0557 | Tzvetan    | Zielinski | 1957-05-23 |
| skall_0258 | Saniya     | Kalloufi  | 1958-02-19 |
| speac_0452 | Sumant     | Peac      | 1952-04-19 |
| dpive_0663 | Duangkaew  | Piveteau  | 1963-06-01 |
+------------+------------+-----------+------------+
10 rows in set (0.05 sec)()