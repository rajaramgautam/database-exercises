-- Exercises

-- Exercise Goals

-- Use CASE statements or IF() function to explore information in the employees database
-- Create a file named case_exercises.sql and craft queries to return the results for the following criteria:

# 1. Write a query that returns all employees (emp_no), their department number, their start date, their end date, and a new column 'is_current_employee' 
#    that is a 1 if the employee is still with the company and 0 if not.
select * from departments;
select * from employees;
select * from dept_emp;

	select e.emp_no, dept_no, hire_date, to_date,
		case to_date 
			when to_date > curdate() then 1
			else 0
			end as is_current_employee
			
	from employees as e
	join dept_emp as de on e.emp_no = de.emp_no;
	
	
	select emp_no, dept_no, hire_date, to_date, case
	when to_date > curdate() then 1
	else 0
	end as still_employed
from employees
join dept_emp using (emp_no);

# 2. Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.


select * from departments;
select * from employees;
select * from dept_emp;

select last_name, case
	when substring(last_name, 1, 1) in ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H') then 'A-H'
	when substring(last_name, 1, 1) in ('I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q') then 'I-Q'
    when substring(last_name, 1, 1) in ('R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z') then 'R-Z'
    	else 'others'
    	end as 'alpha_group'
   from employees;
# 3. How many employees (current or previous) were born in each decade?

select * from departments;
select * from employees;
select * from dept_emp;

select count('fifties'), count('sixties') from (select case 
when birth_date like'195%' then 'fifties'
when birth_date like '196%' then 'sixties' 

	end as decade

from employees) as e ;

-- BONUS

# 1. What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?
SELECT 
       CASE 
           WHEN dept_name IN ('research', 'development') THEN 'R&D'
           WHEN dept_name IN ('sales', 'marketing') THEN 'Sales & Marketing' 
           WHEN dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
           	  WHEN dept_name IN ('Finance', 'Human Resources') THEN 'Finance & HR'
           ELSE dept_name
           END AS dept_group
           
FROM departments
group by dept_group;

SELECT 
       CASE 
           WHEN dept_name IN ('research', 'development') THEN 'R&D'
           WHEN dept_name IN ('sales', 'marketing') THEN 'Sales & Marketing' 
           WHEN dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
           	  WHEN dept_name IN ('Finance', 'Human Resources') THEN 'Finance & HR'
           ELSE dept_name
           END AS dept_group,
           avg(salary)
           
FROM departments
join dept_emp using(dept_no)
join salaries using(emp_no)
group by dept_group;

select * from salaries;
select * from departments;
select * from dept_emp;


create temporary table hopper_1557.currentavg as 
select dept_name, avg(salary) as current_average from salaries as s 
join dept_emp de using(emp_no)
join departments d using(dept_no)
where s.to_date > curdate()
group by dept_name;

select * from hopper_1557.currentavg; 


SELECT * FROM salaries;

select * from departments;

+-------------------+-----------------+
| dept_group        | avg_salary      |
+-------------------+-----------------+
| Customer Service  |                 |
| Finance & HR      |                 |
| Sales & Marketing |                 |
| Prod & QM         |                 |
| R&D               |                 |
+-------------------+-----------------+