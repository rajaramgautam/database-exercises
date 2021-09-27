-- Create a file named subqueries_exercises.sql and craft queries to return the results for the following criteria:
-- Created
# 1. Find all the current employees with the same hire date as employee 101010 using a sub-query.

	select * from employees where emp_no = 101010;
	select * from dept_emp;
	
	
	select first_name, last_name, hire_date from employees as e join dept_emp as dm 
	on e.emp_no = dm.emp_no
	where hire_date in (select hire_date from employees where emp_no = 101010 ) and 
	dm.to_date > curdate();

# 2. Find all the titles ever held by all current employees with the first name Aamod.

select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;

-- select title, first_name from titles as t
-- join employees as e on t.emp_no = e.emp_no
-- where to_date > curdate() and e.first_name = 'Aamod';

-- select e.first_name, title from titles as t
-- join employees as e on t.emp_no = e.emp_no
-- where to_date > curdate() and e.first_name = 'Aamod';


select title
 from titles
 where emp_no IN (
    select emp_no
    from employees
    join dept_emp using(emp_no)
    where first_name = 'aamod'
    and to_date > now()
 );

# 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;

-- select count(*) as ex_employees from titles as t
-- join employees as e on t.emp_no = e.emp_no
-- where to_date < curdate();

-- 203184

-- select count(*) as ex_employees from salaries as s
-- join employees as e on s.emp_no = e.emp_no
-- where to_date < curdate();

-- 2603923


select count(*) from employees
 where emp_no not in 
 	(select emp_no
 	from dept_emp
 	where to_date > now()
 );
 -- Same solution using 'salaries' table:
 select count(*)
 from employees
 where emp_no NOT IN
 	(
 	select emp_no
 	from salaries
 	where to_date > now()
 	);



# 4. Find all the current department managers that are female. List their names in a comment in your code.

select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;

select concat(first_name, ' ', last_name) as 'Full Name' , e.gender, dm.to_date from dept_manager as dm
join employees as e on dm.emp_no = e.emp_no
where e.gender = 'F' and dm.to_date > curdate();

-- 4
-- Isamu Legleitner, Karsten Sigstam, Leon DasSarma. Hilary Kambil

# 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.
select avg(salary) from salaries;

select concat(first_name, ' ', last_name) as 'Full Name', s.to_date, s.salary from salaries as s
join employees as e on s.emp_no = e.emp_no
where to_date > curdate() and salary > (select avg(salary) from salaries);


select first_name, last_name, emp_no
 from employees
 join dept_emp de using(emp_no)
 where de.to_date > now() 
 and emp_no IN
 (
 	select emp_no
 	from salaries
 	where salary > (select avg(salary) from salaries)

 );


# 6. How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?

-- Standard Deviation for salary

select stddev(salary) from salaries
where to_date > curdate();

-- 17309.96

-- Max current salary
select max(salary) from salaries
where to_date > curdate();
-- 158220

-- lower limit for one standard deviation of salary

select max(salary) - (select stddev(salary) from salaries
where to_date > curdate()) from salaries
where to_date > curdate();

--140910.040


-- Number of salaries with in that range

select count(*) from salaries 
where salary <=
(
select max(salary) from salaries
where to_date > curdate()
)
 and salary >=
 (
 select max(salary) - (select stddev(salary) from salaries
where to_date > curdate()) from salaries
where to_date > curdate()
 )
and to_date > curdate() as e;

--83
total current employees
select count(*) from salaries where to_date > curdate();

--240124
select( 
(select count(*) from salaries 
where salary <=
(
select max(salary) from salaries
where to_date > curdate()
)
 and salary >=
 (
 select max(salary) - (select stddev(salary) from salaries
where to_date > curdate()) from salaries
where to_date > curdate()
 )
and to_date > curdate()) 
/
(
select count(*) from salaries where to_date > curdate())) * 100 as percentage;


select((select count(*)
 from salaries
 where to_date > now()
 and salary > (
 (select max(salary) from salaries where to_date > now()) - 
 (select std(salary) from salaries where to_date > now())
 ))/(select count(*)
 from salaries 
 where to_date > now())) * 100 as "percentage of salaries within 1 Stdev of Max";

# 7. Hint Number 1 You will likely use a combination of different kinds of subqueries.
# 8. Hint Number 2 Consider that the following code will produce the z score for current salaries.
-- Returns the historic z-scores for each salary
-- Notice that there are 2 separate scalar subqueries involved
SELECT salary, 
    (salary - (SELECT AVG(salary) FROM salaries)) 
    / 
    (SELECT stddev(salary) FROM salaries) AS zscore
FROM salaries;
BONUS

-- Find all the department names that currently have female managers.

select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;

select d.dept_name from departments as d 
join dept_manager as dm on d.dept_no = dm.dept_no
join employees as e on e.emp_no = dm.emp_no
where gender = 'F' and dm.to_date > curdate();

-- Find the first and last name of the employee with the highest salary.

select first_name, last_name, salary from salaries as s
join employees as e on s.emp_no = e.emp_no
where salary = (select max(salary) from salaries where to_date > curdate());

-- Find the department name that the employee with the highest salary works in.


select dept_name from departments as d 
join dept_emp as de on d.dept_no = de.dept_no
join employees as e on e.emp_no = de.emp_no
join salaries as s on e.emp_no = s.emp_no
where salary = (select max(salary) from salaries where to_date > curdate());



