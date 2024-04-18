-- 1. select all employees in department 10 whose salary is greater than 3000. [table: employee]
select * from employee;
select empid,concat(fname," ",lname) as full_name,salary from employee where deptno = 10 and salary > 3000;

# 2.The grading of students based on the marks they have obtained is done as follows:
-- 40 to 50 -> Second Class
-- 50 to 60 -> First Class
-- 60 to 80 -> First Class
-- 80 to 100 -> Distinctions

select * from students;
select id,name,marks,
case 
when marks between 40 and 50 then 'Second Class'
when marks between 50 and 60 then 'First Class'
when marks between 60 and 80 then 'First Class'
when marks between 80 and 100 then 'Distinctions'
else 'Fail'
end as 'Result' from students;

-- a. How many students have graduated with first class?
select count(id) from (
              select *,
              case 
              when marks between 40 and 50 then 'Second Class'
              when marks between 50 and 60 then 'First Class'
              when marks between 60 and 80 then 'First Class'
              when marks between 80 and 100 then 'Distinctions'
              else 'Fail'
              end as 'Result' from students) as ss 
              where ss.Result = 'First Class';

-- b. How many students have obtained distinction? [table: students]
alter table students
add column Result varchar(100) after marks;

set sql_safe_updates = 0;
update students 
set Result =
case 
when marks between 40 and 50 then 'Second Class'
when marks between 50 and 60 then 'First Class'
when marks between 60 and 80 then 'First Class'
when marks between 80 and 100 then 'Distinctions'
else 'Failed'
end;

select count(id) as Total_Distinction from students where Result = 'Distinctions';

# 3. Get a list of city names from station with even ID numbers only. Exclude duplicates from your answer.[table: station]
select * from station;
select distinct(city) from station where id % 2 = 0;

# 4. Find the difference between the total number of city entries in the table and the number of distinct city 
# entries in the table. In other words, if N is the number of city entries in station, and N1 is the number of 
# distinct city names in station, write a query to find the value of N-N1 from station.[table: station]

select count(city) - count(distinct(city)) as 'Difference Between Number of Distinct and All Cities' from station;

# 5. Answer the following

-- a. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. 
-- Your result cannot contain duplicates. [Hint: Use RIGHT() / LEFT() methods]
select * from station;
select distinct(city) from station where city like "A%" or city like "E%" or city like "I%" or city like "O%" or city like "U%";

-- b. Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters.
-- Your result cannot contain duplicates.

select city
	FROM station
		where city regexp '^a|^e|^i|^o|^u' AND
              city regexp 'a$|e$|i$|o$|u$'
			GROUP BY city
				order by city;
	
-- c. Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
select distinct city from station where city not regexp '^a|^e|^i|^o|^u' order by city;

-- d. Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels.
--  Your result cannot contain duplicates. [table: station]
select distinct city from station where city not regexp '^a|^e|^i|^o|^u' and 
										city not regexp 'a$|e$|i$|o$|U$'
                                        order by city ;

#6. Write a query that prints a list of employee names having a salary greater than $2000 per month who have been 
# employed for less than 36 months. Sort your result by descending order of salary. [table: emp]
select * from emp;

select Concat(first_name, ' ', last_name) as Employee,
       Concat(salary, '$') as 'Salary($)',
       hire_date,
      timestampdiff(MONTH, hire_date, current_date()) as 'Total_Months_Joined'
	from emp
		where salary > 2000
			having Total_Months_Joined < 36
				order by salary desc;
                
# 7. How much money does the company spend every month on salaries for each department? [table: employee]
-- Expected Result
 ----------------------
 +--------+--------------+
+--------+--------------+
|     10 |     20700.00 |
|     20 |     12300.00 |
|     30 |      1675.00 |
+--------+--------------+
-- 3 rows in set (0.002 sec)
select * from employee;
select deptno, sum(salary) as Total_Salary from employee 
group by deptno;

# 8. How many cities in the CITY table have a Population larger than 100000. [table: city]
select * from city;

select name as City , population from city where population > 100000 order by population desc;

# 9. What is the total population of California? [table: city]
select district, sum(population) as Total_population from city 
where district = 'California' group by district;

# 10. What is the average population of the districts in each country? [table: city]

select countrycode, district, avg(population) as avg_population from city 
group by district  order by avg_population desc;

# 11. Find the ordernumber, status, customernumber, customername and comments for all orders that are 
# ‘Disputed=  [table: orders, customers]

select * from customers;
select * from orders;

select o.customerNumber,c.customerName,
       o.orderNumber,o.status, o.comments
       from customers c
            join orders o
                 using(customerNumber)
				       where o.status = 'Disputed';

