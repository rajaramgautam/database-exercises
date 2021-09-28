-- Create a file named temporary_tables.sql to do your work for this exercise.

# 1. Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department. Be absolutely sure to create this table on your own database. If you see "Access denied for user ...", it means that the query was attempting to write a new table to a database that you can only read.

CREATE TEMPORARY TABLE hopper_1557.employees_with_departments AS
SELECT first_name, last_name, dept_name
FROM employees
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no);

select * from hopper_1557.employees_with_departments;
desc hopper_1557.employees_with_departments;

select * from dept_emp;
select * from departments;

-- Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
alter table hopper_1557.employees_with_departments add full_name varchar(90);
-- Update the table so that full name column contains the correct data

update hopper_1557.employees_with_departments set full_name = 
concat(first_name, ' ', last_name);
-- Remove the first_name and last_name columns from the table.

alter table hopper_1557.employees_with_departments drop column first_name; -- drop one column at a time.
alter table hopper_1557.employees_with_departments drop column last_name;
-- What is another way you could have ended up with this same table?

desc hopper_1557.employees_with_departments;
select * from employees;
select * from departments;
select * from hopper_1557.employees_with_departments;
# 2. Create a temporary table based on the payment table from the sakila database.
-- select * from payment;
create temporary table hopper_1557.payment_new as 
select * from payment; 

alter table hopper_1557.payment_new add column number_of_cents int;
-- select * from hopper_1557.payment_new;
update hopper_1557.payment_new set number_of_cents = 100*amount;
alter table hopper_1557.payment_new drop amount; -- USER neeeds to memorize the order of operation.


-- Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.

# 3. Find out how the current average pay in each department compares to the overall, historical average pay. In order to make the comparison easier, you should use the Z-score for salaries. In terms of salary, what is the best department right now to work for? The worst?

select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;


-- Current average pay
select dept_name, avg(salary) as current_average from salaries as s 
join dept_emp de using(emp_no)
join departments d using(dept_no)
where s.to_date > curdate()
group by dept_name;
-- current average and standard deviation

select dept_name, avg(salary) as current_average from salaries as s 
join dept_emp de using(emp_no)
join departments d using(dept_no)
where s.to_date > curdate()
group by dept_name;




-- Historic average pay
select dept_name, avg(salary) as historic_average from salaries as s 
join dept_emp de using(emp_no)
join departments d using(dept_no)
group by dept_name;

-- Historic average pay and standard deviation
select dept_name, avg(salary) as historic_average, stddev(salary) as std_his_salary from salaries as s 
join dept_emp de using(emp_no)
join departments d using(dept_no)
group by dept_name;

-- Historic average pay, historic standard deviation, current average
select dept_name, avg(salary) as historic_average, stddev(salary) as std_his_salary, current_average from 

(select dept_name, avg(salary) as current_average from salaries as s 
join dept_emp de using(emp_no)
join departments d using(dept_no)
where s.to_date > curdate()
group by dept_name) as f
join departments d using(dept_name)  
join dept_emp de using(dept_no)
join salaries s using(emp_no)
group by dept_name;

-- Historic average pay, historic standard deviation, current average and z-score
select dept_name, historic_average, std_his_salary, current_average, (current_average - historic_average)/std_his_salary from (select dept_name, avg(salary) as historic_average, stddev(salary) as std_his_salary, current_average from 

(select dept_name, avg(salary) as current_average from salaries as s 
join dept_emp de using(emp_no)
join departments d using(dept_no)
where s.to_date > curdate()
group by dept_name) as f
join departments d using(dept_name)  
join dept_emp de using(dept_no)
join salaries s using(emp_no)
group by dept_name) as g ;

-- Based on z-score, Human Resources is best and sales is the worst one.


-- Ans.: - Sales