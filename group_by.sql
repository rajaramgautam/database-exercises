# Group By
select column from table group by column_name [asc /desc];
select first_name from employees group by first_name;

select distinct first_name from employees;

select last_name, first_name from employees group by last_name, first_name;


# Aggregate Functions

-- count(*)
select count(first_name) from employees where first_name not like '%a%';

select count(*) from employees;

# Using Group By with aggregate functions
select first_name, count(first_name ) from employees 
	where first_name not like '%a%'
group by first_name;


Select hire_date, count(*) from employees group by hire_date
order by count(*) DESC
limit 10 offset;

# Adding conditions to Group By with HAVING

SELECT last_name, count(*) AS n_same_last_name
FROM employees
GROUP BY last_name
HAVING n_same_last_name < 150;

SELECT concat(first_name, " ", last_name) AS full_name, count(*) AS n_same_full_name
FROM employees
GROUP BY full_name
HAVING n_same_full_name >= 5;
