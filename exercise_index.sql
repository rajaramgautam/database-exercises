# 1. USE your employees database.
     USE employees;
# 2. DESCRIBE each table and inspect the keys and see which columns have indexes and keys.
desc departments;
desc dept_emp;
desc dept_manager;
desc employees;
desc salaries;
desc titles;


show create table departments;
show create table dept_emp;
show create table dept_manager;
show create  table employees;
show create table salaries;
show create  table titles;

# Difference between index and primary keys

-- Primary key is a type of index. Index enhances efficiency of database.

