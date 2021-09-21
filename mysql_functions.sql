select concat('Hello ', 'Codeup', '!') as Greet;

select substr('We will Study Data Science in Code Up.', 9, 36) as Mission;

select upper('welcome to codeup') as Upper_Conversion;

select lower('WELCOME TO CODEUP') as Lower_Conversion;

select replace('Welcome To CodeUp', 'Welcome', 'Make A Difference' ) as Repalcement;

select now();

select curdate();

select curtime();

SELECT CONCAT(
    'Teaching people to code for ',
    UNIX_TIMESTAMP() - UNIX_TIMESTAMP('2014-02-04'),
    ' seconds'
) as Time_Origin_Defined_By_Third_Party;

select min(emp_no ) from employees;
select max(emp_no ) from employees;
select avg(emp_no ) from employees;
select sum(emp_no ) from employees;

select 1+'4', '3'-1, concat('Here is a number: ', 123);

select 
cast(123 as char) as String_Number;