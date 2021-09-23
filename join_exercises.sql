-- Create a file named join_exercises.sql to do your work in.
-- Created

## Join Example Database

# 1. Use the join_example_db. Select all the records from both the users and roles tables.
use join_example_db;

# 2. Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.

SELECT users.name as user_name, roles.name as role_name
FROM users
JOIN roles ON users.role_id = roles.id;


SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;


# 3. Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.

SELECT count(*) number_employee_per_role , roles.name as role_name
FROM users
JOIN roles ON users.role_id = roles.id
GROUP BY role_name;


# Employees Database

# 1. Use the employees database.

use employees;


# 2. Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.
-- select * from departments;
-- select * from dept_manager;
-- select * from employees;


SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM employees AS e
JOIN dept_manager AS dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01'
order by dept_name;


  Department Name    | Department Manager
 --------------------+--------------------
  Customer Service   | Yuchang Weedman
  Development        | Leon DasSarma
  Finance            | Isamu Legleitner
  Human Resources    | Karsten Sigstam
  Marketing          | Vishwani Minakawa
  Production         | Oscar Ghazalie
  Quality Management | Dung Pesch
  Research           | Hilary Kambil
  Sales              | Hauke Zhang
# 3. Find the name of all departments currently managed by women.
SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM employees AS e
JOIN dept_manager AS dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01' and gender = 'F';

Department Name | Manager Name
----------------+-----------------
Development     | Leon DasSarma
Finance         | Isamu Legleitner
Human Resources | Karsetn Sigstam
Research        | Hilary Kambil
# 4. Find the current titles of employees currently working in the Customer Service department.

select * from titles;
select * from departments;
select * from employees;
select * from dept_manager;
select * from dept_emp;

SELECT title, count(*) as title_count
FROM titles AS t
JOIN dept_emp AS de
  ON de.emp_no = t.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
WHERE d.dept_no = 'd009' and t.to_date = '9999-01-01'
Group By title 
Order By Title;

Title              | Count
-------------------+------
Assistant Engineer |    68
Engineer           |   627
Manager            |     1
Senior Engineer    |  1790
Senior Staff       | 11268
Staff              |  3574
Technique Leader   |   241
# 5. Find the current salary of all current managers.
select * from salaries;
select * from employees;
select * from departments;
select * from dept_manager;
select * from titles;

SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name, salary
FROM employees as e
JOIN salaries as s
on e.emp_no = s.emp_no 
JOIN dept_manager AS dm
  ON dm.emp_no = s.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
  WHERE dm.to_date = '9999-01-01' and s.to_date = '9999-01-01'
  order by dept_name;



Department Name    | Name              | Salary
-------------------+-------------------+-------
Customer Service   | Yuchang Weedman   |  58745
Development        | Leon DasSarma     |  74510
Finance            | Isamu Legleitner  |  83457
Human Resources    | Karsten Sigstam   |  65400
Marketing          | Vishwani Minakawa | 106491
Production         | Oscar Ghazalie    |  56654
Quality Management | Dung Pesch        |  72876
Research           | Hilary Kambil     |  79393
Sales              | Hauke Zhang       | 101987
# 6. Find the number of current employees in each department.


select d.dept_no, d.dept_name, count(emp_no) as num_employees 
from departments as d
join dept_emp as de
on de.dept_no = d.dept_no
where de.to_date = '9999-01-01'
group by d.dept_no
order by d.dept_no; 

+---------+--------------------+---------------+
| dept_no | dept_name          | num_employees |
+---------+--------------------+---------------+
| d001    | Marketing          | 14842         |
| d002    | Finance            | 12437         |
| d003    | Human Resources    | 12898         |
| d004    | Production         | 53304         |
| d005    | Development        | 61386         |
| d006    | Quality Management | 14546         |
| d007    | Sales              | 37701         |
| d008    | Research           | 15441         |
| d009    | Customer Service   | 17569         |
+---------+--------------------+---------------+
# 7. Which department has the highest average salary? Hint: Use current not historic information.
select * from salaries;
select * from employees;
select * from departments;
select * from dept_manager;
select * from titles;
select * from dept_emp;


select d.dept_name, avg(salary)as average_salary 
from departments as d
join dept_emp as de
on de.dept_no = d.dept_no
join salaries as s
on de.emp_no = s.emp_no
where de.to_date = '9999-01-01' and s.to_date = '9999-01-01'
group by d.dept_name;

select d.dept_name, avg(salary)as average_salary 
from departments as d
join dept_emp as de
on de.dept_no = d.dept_no
join salaries as s
on de.emp_no = s.emp_no
where de.to_date = '9999-01-01' and s.to_date = '9999-01-01'
group by d.dept_name;


+-----------+----------------+
| dept_name | average_salary |
+-----------+----------------+
| Sales     | 88852.9695     |
+-----------+----------------+
# 8. Who is the highest paid employee in the Marketing department?
select * from salaries;
select * from employees;
select * from departments;
select * from dept_manager;
select * from titles;
select * from dept_emp;

select max(salary) from employees as e
join dept_emp as de on e.emp_no = de.emp_no
join salaries as s on de.emp_no = s.emp_no
where dept_no = 'd001';

select first_name, last_name from employees as e
join dept_emp as de on e.emp_no = de.emp_no
join salaries as s on de.emp_no = s.emp_no
where dept_no = 'd001' and salary = 145128;

select first_name, last_name from employees as e
join dept_emp as de on e.emp_no = de.emp_no
join salaries as s on de.emp_no = s.emp_no
where dept_no = 'd001' and 
salary = (select max(salary) from employees as e
join dept_emp as de on e.emp_no = de.emp_no
join salaries as s on de.emp_no = s.emp_no
where dept_no = 'd001' );


group by first_name, last_name;

+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Akemi      | Warwick   |
+------------+-----------+
# 9. Which current department manager has the highest salary?
select * from salaries;
select * from employees;
select * from departments;
select * from dept_manager;
select * from titles;
select * from dept_emp;

select first_name, last_name, salary, dept_name from departments as d 
join dept_manager as dm on d.dept_no = dm.dept_no
join employees as e on dm.emp_no = e.emp_no
join salaries as s on s.emp_no = e.emp_no;

select max(salary) from departments as d 
join dept_manager as dm on d.dept_no = dm.dept_no
join employees as e on dm.emp_no = e.emp_no
join salaries as s on s.emp_no = e.emp_no
where s.to_date = '9999-01-01' and dm.to_date = '9999-01-01';

select first_name, last_name, salary, dept_name from departments as d 
join dept_manager as dm on d.dept_no = dm.dept_no
join employees as e on dm.emp_no = e.emp_no
join salaries as s on s.emp_no = e.emp_no
where salary = (select max(salary) from departments as d 
join dept_manager as dm on d.dept_no = dm.dept_no
join employees as e on dm.emp_no = e.emp_no
join salaries as s on s.emp_no = e.emp_no
where s.to_date = '9999-01-01' and dm.to_date = '9999-01-01');

+------------+-----------+--------+-----------+
| first_name | last_name | salary | dept_name |
+------------+-----------+--------+-----------+
| Vishwani   | Minakawa  | 106491 | Marketing |
+------------+-----------+--------+-----------+
# 10. Bonus Find the names of all current employees, their department name, and their current manager's name.
 
 select * from salaries;
select * from employees;
select * from departments;
select * from dept_manager;
select * from titles;
select * from dept_emp;

-- Maneger Name List
SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM employees AS e
JOIN dept_manager AS dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01'
order by dept_name;

SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM employees AS e
JOIN dept_manager AS dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01'
order by dept_name;
 
 
 
 select CONCAT(e.first_name, ' ', e.last_name) AS Employee_full_name, dept_name
 from employees as e
 join dept_manager as dm on e.emp_no = dm.emp_no
 join departments as d on d.dept_no = dm.dept_no;
 
 SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Employee Name',
		d.dept_name AS 'Department Name', m.manager_name AS 'Manager Name'
FROM dept_emp AS de
JOIN employees AS e
	ON de.emp_no = e.emp_no
JOIN departments AS d
	ON de.dept_no = d.dept_no AND de.to_date > CURDATE()
JOIN (SELECT dm.dept_no, CONCAT(e.first_name, ' ', e.last_name) AS manager_name
	  FROM dept_manager AS dm
      JOIN employees AS e
          ON dm.emp_no = e.emp_no AND to_date > CURDATE()) AS m
ON m.dept_no = d.dept_no;

240,124 Rows

Employee Name | Department Name  |  Manager Name
--------------|------------------|-----------------
 Huan Lortz   | Customer Service | Yuchang Weedman

 .....
# 11. Bonus Who is the highest paid employee within each department.

select * from salaries;
select * from employees;
select * from departments;
select * from dept_manager;
select * from titles;
select * from dept_emp;

WITH dept_sal AS (SELECT dept_name, max(salary) max_salary FROM salaries
					JOIN dept_emp de
					ON de.emp_no = salaries.emp_no AND salaries.to_date > CURDATE()
					JOIN departments d
					ON d.dept_no = de.dept_no
					GROUP BY dept_name),
	emp_d_sal AS (SELECT e.emp_no, e.first_name, e.last_name, d.dept_name, s.salary
						FROM employees e
						JOIN dept_emp de ON de.emp_no = e.emp_no
						JOIN departments d ON d.dept_no = de.dept_no
						JOIN salaries s ON s.emp_no = e.emp_no AND s.to_date > CURDATE())

SELECT CONCAT(eds.first_name, ' ', eds.last_name) AS full_name, eds.dept_name, max_salary
FROM emp_d_sal eds
INNER JOIN dept_sal
ON eds.dept_name = dept_sal.dept_name AND eds.salary = dept_sal.max_salary;

select
max(salary) from employees as e
join dept_emp as de on e.emp_no = de.emp_no
join salaries as s on de.emp_no = s.emp_no
group by dept_no;