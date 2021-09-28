# 1 Format for crating temporary table.

create temporary table temp_table(...);

-- temporary tables are removed on closing database or dropping table.

# 2 Table Creation Example

CREATE TEMPORARY TABLE my_numbers(
    n INT UNSIGNED NOT NULL 
);


CREATE TEMPORARY TABLE hopper_1557.employees_with_departments AS
SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
LIMIT 100;


desc hopper_1557.employees_with_departments;