# 1. Create a new file named group_by_exercises.sql
 -- created

# 2. In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.
select * from titles;

select distinct title from titles
where to_date = '9999-01-01';

-- 7

# 3. Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.

select last_name from employees
group by last_name
having last_name like 'e%e';



# 4. Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
select first_name, last_name from employees
group by first_name, last_name
having last_name like 'e%e'


# 5. Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.

select distinct last_name from employees
group by last_name 
having last_name like '%q%' and 
      last_name not like '%qu%';

      
      --Chleq, Lindqvist, Qiwen

# 6. Add a COUNT() to your results (the query above) to find the number of employees with the same last name.

select distinct last_name, count(*) from employees
group by last_name 
having last_name like '%q%' and 
      last_name not like '%qu%';

# 7. Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.

select first_name, count(*) as counting_repetition from employees
group by first_name
having first_name in ('Irena', 'Vidya', 'Maya');

# 8. Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there?

select 
concat(substr(lower(first_name), 1, 1), substr(lower(last_name), 1, 4), substr(birth_date, 6, 2), substr(birth_date, 3, 2))      
as username,
first_name, last_name, birth_date 
from employees;

select 
concat(substr(lower(first_name), 1, 1), substr(lower(last_name), 1, 4), substr(birth_date, 6, 2), substr(birth_date, 3, 2))      
as username,
count(*) as frequency_username
from employees
group by username
having frequency_username >1 ;

--13251

# 9. More practice with aggregate functions:

-- Find the historic average salary for all employees. Now determine the current average salary.
   select * from salaries;
   select avg(salary) from salaries;
    --63810.7448
-- Now find the historic average salary for each employee. Reminder that when you hear "for each" in the problem statement, you'll probably be grouping by that exact column
select emp_no, avg(salary) as average_salary_per_employee from salaries
group by emp_no;

-- Find the current average salary for each employee.
select emp_no, avg(salary) as average_salary_per_employee from salaries
where to_date > curdate()
group by emp_no;
-- Find the maximum salary for each current employee.
select emp_no, max(salary) as max_salary_per_employee from salaries
where to_date > curdate()
group by emp_no;

-- Now find the max salary for each current employee where that max salary is greater than $150,000.
select emp_no, max(salary) as max_salary_per_employee_above_150k from salaries
where to_date > curdate() and salary > 150000
group by emp_no;

select * from salaries;

-- Find the current average salary for each employee where that average salary is between $80k and $90k.
select emp_no, max(salary) as max_salary_per_employee_between_80_90 from salaries
where to_date > curdate() and (salary >= 80000 and salary <= 90000) 
group by emp_no;
