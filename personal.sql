select * from Countries
select * from Departments
select * from Employees --order by commission_pct desc
select * from Job_History
select * from Jobs
select * from Locations
select * from Regions

--1.) Display the minimum salary. 
select min(salary) from employees

--2.) Display the highest salary.
select max(salary) from employees

--3.) Display the total salary of all employees.
select sum (salary) from employees

--4.) Display the average salary of all employees.
select AVG( salary) from employees

--5.) Issue a query to count the number of rows in the employee table. The result should be just one row.
select count(*) from employees

--6.) Issue a query to count the number of employees that make commission. The result should be just one row.
select count(commission_pct) from employees 

--7.) Issue a query to count the number of employees’ first name column. The result should be just one row.
select count (first_name) from employees

--8.) Display all employees that make less than Peter Hall.
select first_name, Last_name, salary from employees where salary<
(select salary from employees where first_name ='Peter' and last_name= 'hall')
order by salary asc

--9.) Display all the employees in the same department as Lisa Ozer.
select first_name, last_name, department_id from employees where department_id =
(select department_id from employees where first_name = 'lisa' and last_name = 'Ozer')
--10.) Display all the employees in the same department as Martha Sullivan and that make more than TJ Olson.

select first_name, Last_name, department_id, salary from employees where department_id=
(select department_id from employees where first_name = 'martha' and last_name = 'sullivan') and salary>
(select salary from employees where first_name ='tj' and last_name = 'olson') order by salary desc 


--11.) Display all the departments that exist in the departments table that are not in the employees’ table. Do not use a where clause.
select department_id from departments
except
select distinct department_id from employees

--12.) Display all the departments that exist in department tables that are also in the employees’ table. Do not use a where clause.
select department_id from departments
intersect
select distinct department_id from employees

--13.) Display all the departments name, street address, postal code, city, and state of each department. Use the departments and locations table for this query.
select d.department_id, d.department_name, l.street_address, l.postal_code, l.city, l.state_province 
	from departments d join locations l on d.location_id = l.location_id 
--14.) Display the first name and salary of all the employees in the accounting departments. 
select d.department_id, d.department_name, e. first_name, e.last_name, e.salary
	from departments d join employees e on d.department_id = e.department_id where d.department_name = 'accounting'

--15.) Display all the last name of all the employees whose department location id are 1700 and 1800.
select d.department_id, d.last_name, e.location_id
	from departments e join employees d on d.department_id = e.department_id
	where e.location_id = 1700 or e.location_id = 1800

	select d.department_id, d.last_name, e.location_id
	from departments e join employees d on d.department_id =e.department_id
	where e.location_id in (1700,1800)
--16.) Display the phone number of all the employees in the Marketing department.
select d.department_id, d.department_name, e.phone_number
	from departments d join employees e on d.department_id = e.department_id where d.department_name = 'marketing'

--17.) Display all the employees in the Shipping and Marketing departments who make more than 3100.
select d.department_id, d.department_name, e.employee_id, e.salary
	from employees e join departments d on e.department_id = d.department_id where d.department_name in ( 'Shipping', 'Marketing')
	and e.salary > 3100


--18). Write an SQL query to print the first three characters of FIRST_NAME from employee’s table.
select first_name, substring (first_name,1,3) from employees

-- 19.) Display all the employees who were hired before Tayler Fox.
select first_name, Last_name, Hire_date from employees where hire_date<
(select hire_date from employees where first_name = 'tayler' and last_name ='fox')

--20.) Display names and salary of the employees in executive department. 


--21.) Display the employees whose job ID is the same as that of employee 141.
select job_id, employee_id from employees where job_id =
(select job_id from employees where employee_id= 141)

--22.) For each employee, display the employee number, last name, salary, and salary increased by 15% and expressed as a whole number. Label the column New Salary.
select employee_id, last_name, salary, floor(salary+(.15*salary)) as 'new_salary' from employees 

--23). Write an SQL query to print the FIRST_NAME and LAST_NAME from employees table into a single column COMPLETE_NAME. A space char should separate them.
select CONCAT(first_name,' ',last_name) as complete_name from employees

--24.) Display all the employees and their salaries that make more than Abel.
select first_name, Last_name, salary from employees where salary>
(select Salary from employees where last_name = 'abel')
--25.) Create a query that displays the employees’ last names and commission amounts. If an employee does not earn commission, put “no commission”. Label the column COMM. 
select last_name, commission_pct,
	(case when cast(commission_pct as varchar) is not null
	then 'commission'
	--cast(commission_pct as varchar)
	else 'no commission' end) as comm from employees

	select last_name, commission_pct,
	(case when commission_pct is not null
	then commission_pct
	else 0.00 end) as comm from employees

--26.) Create a unique listing of all jobs that are in department 80. Include the location of department in the output.
select distinct a.job_id, b.location_id, a.department_id from employees a
join departments b on a.department_id= b.department_id
where a.department_id =80

--27.) Write a query to display the employee’s last name, department name, location ID, and city of all employees who earn a commission.
select a.last_name, b.department_name, b.location_id, c.city from employees a
join departments b on a.department_id = b.department_id
join locations c on b.location_id= c.location_id
where a.commission_pct is not null

select a.last_name, b.department_name, b.location_id, c.city from employees a
join departments b on a.department_id = b.department_id
join locations c on b.location_id= c.location_id
where a.commission_pct is null

--28.) Create a query to display the name and hire date of any employee hired after employee Davies.
select last_name, hire_date from employees where hire_date >
(select hire_date from employees where last_name ='davies')
order by hire_date

--29.) Write an SQL query to show one row twice in results from a table.
select job_id from jobs
union all 
select job_id from jobs

select job_id from jobs
Union
select job_id from employees

select job_id from jobs
union all
select job_id from employees


--30.) Display the highest, lowest, sum, and average salary of all employees. Label the columns Maximum, Minimum, Sum, and Average, respectively.
--Round your results to the nearest whole number.

select floor (max(salary)) as maximum,
	Floor (min(salary)) as Minimum,
	Floor (Sum(salary)) as Sum,
	Floor (AVG(salary)) as Average from employees


--31.) Write an SQL query to show the top n (say 10) records of a table.
select top(10)* from employees
Select top(20) first_name from employees

--32.) Display the MINIMUN, MAXIMUM, SUM AND AVERAGE salary of each job type. 
select job_id, floor(Max(salary)) as maximum,
	floor(min(salary)) as minimum,
	floor(Sum(salary)) as Sum,
	Floor(AVG(salary)) as Average from employees
	Group by job_id

	select job_id, first_name, last_name, floor(Max(salary)) as maximum,
	floor(min(salary)) as minimum,
	floor(Sum(salary)) as Sum,
	Floor(AVG(salary)) as Average from employees
	Group by job_id, first_name,last_name

--33.) Display all the employees and their managers from the employees’ table.
select a.first_name from employees, b.first_name AS "Manager"
    FROM employees a 
      JOIN employees b ON a.manager_id = b.employee_id;

	  select employee_id, manager_id from employees
	

--34.) Determine the number of managers without listing them. Label the column NUMBER of managers. Hint: use manager_id column to determine the number of managers.
Select COUNT(DISTINCT manager_id) AS "number of managers"
From employees;

--35.) Write a query that displays the difference between the HIGHEST AND LOWEST salaries. Label the column DIFFERENCE
Select Max(salary)-Min(Salary)
	AS difference from employees 


--36.) Display the sum salary of all employees in each department.
select department_id, sum(salary) from employees group by department_id

--37.) Write a query to display each department's name, location, number of employees, and the average salary of employees in the department. 
--Label the column NAME, LOCATION, NUMBER OF PEOPLE, respectively.
select d.department_name as 'name', d.location_id as 'location', count(e.employee_id) as 'number of employees', AVG(e.salary) as 'salary'
	from departments d join employees e ON d.department_id = e.department_id GROUP BY d.department_name, d.location_id


--  38.) Write an SQL query to find the position of the alphabet (‘J’) in the first name column ‘Julia’ from employee’s table.
select CHARINDEX('J', first_name) from employees where first_name = 'Julia'
select first_name,CHARINDEX('J', first_name) from employees --test

--39.) Create a query to display the employee number and last name of all employees who earn more than the average salary. Sort the result in ascending order of salary.
 Select employee_id, last_name, salary FROM employees where salary > 
 (Select AVG(salary) FROM employees)
ORDER BY salary
--40.) Write a query that displays the employee number and last names of all employees 
--who work in a department with any employees whose last name contains a letter U.

--LIKE operators - used in a where clause to search for specified patterns
--2 wildcards -- % and _
--% represents zero, one or multiple characters
--_ represents one single character
--any value that start with 'a' - 'a%'
--any value that ends with "a" -'%a'
--any value that has 'a' in any position - '%a%'
--any value that has 'a' in the second position - '_a%'
--any value that starts with 'a' and it's at least 2 characters in length - 'a_%'
--any value that starts with 'a' and ends with 'o' - 'a%o'

select employee_id, last_name, department_id from employees where department_id in 
(select department_id from employees where last_name Like '%U%') order by department_id

--41.) Display the last name, department number and job id of all employees whose department location ID is 1700. 
select d.department_id, d.last_name, e.location_id, d.job_id
	from departments e join employees d on d.department_id = e.department_id
	where e.location_id = 1700 


--40.) Write a query that displays the employee number and last names of all employees who work in a department with any employees whose last name contains a letter U.
select e.employees_id, e.last_name from employees e
join departments d ON e.department_id = d.department_id where e.department_id In


--42.) Display the last name and salary of every employee whose manager id is the same as kings’

 select last_name, salary, manager_id from employees where manager_id =
	(Select manager_id from employees WHERE last_name = 'King')

--43.) Display the department number, last name, job ID of every employee in the Executive department.
select department_id, last_name, job_id from employees
	where department_id in (select department_id from departments where department_name = 'Executive')



--44.) Display all last name, their department name and id from employees and department tables.

SELECT a.last_name, a.department_id, b.department_id FROM employees a JOIN departments b
	ON a.department_id = b.department_id

--45.) Display all the last name department name, id and location from employees, department, and locations tables.

SELECT a.last_name, a.department_id, b.department_name, c.location_id from employees a
JOIN departments b ON a.department_id = b.department_id
JOIN locations c ON b.location_id = c.location_id

--46.) Write an SQL query to print all employee details from the employees table order by DEPARTMENT Descending.

Select a.first_name, a.Last_name, a.Employee_id, a.Salary, a.manager_id, a.department_id, b.department_name from employees a
	join departments b on a.department_id = b.department_id order by department_id desc

	Select * From employees
ORDER BY department_id DESC

-- 47.) Write a query to determine who earns more than Mr. Tobias:

select last_name, salary from employees where salary> 
(select salary from employees where last_name='Tobias')

--48.) Write a query to determine who earns more than Mr. Taylor:
SELECT first_name, last_name, salary FROM employees
 WHERE salary >(SELECT salary FROM employees WHERE last_name = 'Taylor')

--49.) Find the job with the highest average salary.
SELECT job_id, AVG(salary) AS avg_salary FROM employees
GROUP BY job_id ORDER BY avg_salary DESC

--50.) Find employees that make more than Taylor and are in department 80. 
SELECT e.first_name, e.last_name, e.salary FROM employees e
JOIN employees t ON e.department_id = t.department_id
WHERE e.department_id = 50 
AND t.last_name = 'Taylor' AND e.salary > t.salary

--51.) Display all department names and their full street address.
select a.department_name, b.street_address, b.postal_code, b.city, b.state_province, b.country_id from departments a
join LOCATIONS b on a.location_id= b.location_id

--52.) Write a query to display the number of people with the same job.
SELECT job_id, Count(job_id) FROM Employees GROUP BY job_id


--53.) Write an SQL query to fetch “FIRST_NAME” from employees table in upper case.
Select Upper(first_name) from employees

--54.) Display the full name and salary of the employee that makes the most in departments 50 and 80.
Select CONCAT (First_name, ' ', Last_name) as Full_name, Salary from employees where department_id in (50,50)


--55.) Display the department names for departments 10, 20 and 30.

--56.) Display all the manager id and department names of all the departments in United Kingdom (UK).
--57.) Display the full name and phone numbers of all employees who are not in the location id 1700. 
--58.) Display the full name, department name and hire date of all employees that were hired after Shelli Baida.

Select a.first_name, a.Last_name, b.department_name, a.hire_date from employees a 
JOIN departments b on a.department_id = b.department_id where a .hire_date >
(select	hire_date from employees where first_name= 'shelli' and last_name= 'Baida'
)
--59.) Display the full name and salary of all employees who make the same salary as Janette King.
Select First_name, last_name, salary from employees where salary=
(select salary from employees where first_name = 'Janette' and last_name = 'King')


--60.) Display the full name hire date and salary of all employees who were hired in 2007 and make more than Elizabeth Bates.

Select first_name, Last_name, hire_date, salary from employees where hire_date =
(select hire_date from employees Where hire_date like '%2007')
(Select Salary from employees Where First_name= 'Elizabeth' and Last_name= 'Bates')

--61.) Issue a query to display all departments whose average salary is greater than $8000.

Select department_id, Avg(salary) from departments group by department_id Where Avg(Salary) >8000


--62.) Issue a query to display all departments whose maximum salary is greater than 10000.
Select department_id, Max(salary) from departments group by department_id Where Max(Salary) >10000

--63) Issue a query to display the job title and total monthly salary for each job that has a total salary exceeding $13,000. 
--Exclude any job title that looks like rep and sort the result by total monthly salary.

select job_id, floor(sum(salary)) from employees
group by job_id having Sum(salary)> 13000
and job_id not like'%rep%' order by Sum(salary) desc 


--64.) Issue a query to display the department id, department name, location id and city of departments 20 and 50.
Select a.department_id, a.location_id, a.department_name, b.city from departments a
JOIN Locations b on a.location_id = b.location_id Where a.department_id in (20,50)


--65.) Issue a query to display the city and department name that have a location id of 1400. 
Select a.department_name, b.city from departments a JOIN LOCATIONS b on a.location_id= b.location_id where a.location_id=1400

--66.) Display the salary of last name, job id and salary of all employees whose salary is equal to the minimum salary.
Select Last_name, job_id, Salary from employees where Salary =
(Select Floor(min(Salary)) as 'minimum_salary' from employees)

--67.) Display the departments who have a minimum salary greater than that of department 50.
Select department_id, min(salary) as 'minimum_salary' from Employees group by department_id where min(Salary) <> all
(Select min(Salary) as 'minimum_salary' from employees where department_id=50)

SELECT department_id, MIN (salary) AS min_salary
FROM employees
WHERE department_id <> 50
GROUP BY department_id
HAVING MIN (salary) > (SELECT MIN (salary) FROM employees WHERE department_id = 50) 
ORDER BY department_id;

--68.) Issue a query to display all employees who make more than Timothy Gates and less than Harrison Bloom.

Select First_name, Last_name, Salary from Employees where Salary>
(Select Salary from Employees where First_name = 'Timothy' and Last_name = 'Gates') and Salary <
(Select Salary from Employees where first_name ='Harrison' and Last_name = 'Bloom')

--69.) Issue a query to display all employees who are in Lindsey Smith or Joshua Patel department, 
--who make more than Ismael Sciarra and were hired in 2007 and 2008.

--70.) Issue a query to display the full name, 10-digit phone number, salary, department name, street address, postal code, city, 
--and state province of all employees.

select a.first_name, a.last_name, a.phone_number, a.salary, b.department_name, c. street_address, c.postal_code, c.city, c.State_province from
Employees a JOIN departments b on a.department_id = b.department_id JOIN LOCATIONS c on b.location_id = b.location_id

-- 71.) Write an SQL query that fetches the unique values of DEPARTMENT from employees table and prints its length.

select distinct LEN(department_name), department_name from departments group by department_name 

--72.) Write an SQL query to print all employee details from the employees table order by FIRST_NAME Ascending.

Select First_name, Last_name, employee_id, salary from Employees Order by first_name ASC 