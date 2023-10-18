select *from COUNTRIES
select * from departments
select * from employees --order by desc 
select * from job_history
select * from LOCATIONS
select * from jobs
select * from REGIONS

--1.) Display the minimum salary. 
select min(salary) from employees
--2.) Display the highest salary.
select max(salary) from employees
--3.) Display the total salary of all employees. 
select sum( salary) from employees
--4.) Display the average salary of all employees.
select AVG(salary) from employees
--5.) Issue a query to count the number of rows in the employee table. The result should be just one row.
select count(*) from employees
--6.) Issue a query to count the number of employees that make commission. The result should be just one row.
select COUNT(commission_pct) from employees  
--7.) Issue a query to count the number of employees’ first name column. The result should be just one row
select count(first_name) from employees
--8.) Display all employees that make less than Peter Hall.
select first_name, last_name, salary from employees where salary<
(select salary from employees where first_name = 'Peter' and last_name= 'Hall') order by salary desc

--9.) Display all the employees in the same department as Lisa Ozer.
select first_name, Last_name, department_id from employees where department_id=
(select department_id from employees where first_name = 'Lisa' and last_name ='Ozer')

--10.) Display all the employees in the same department as Martha Sullivan and that make more than TJ Olson.

GREAT ATTEMPT!

select first_name, Last_name, department_id from employees where department_id=
(select department_id from employees where first_name = 'Martha' and last_name = 'Sullivan')
--to connect here, you use the AND function instead of writing a different outer query

--select first_name, last_name, salary from employees 
AND where salary>
(select salary from employees where first_name = 'TJ' and last_name = 'Olson') order by salary desc 