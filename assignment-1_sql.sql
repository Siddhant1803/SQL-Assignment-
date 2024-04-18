#1. create a database called 'assignment' (Note please do the assignment tasks in this database)
	
#2. Create the tables from ConsolidatedTables.sql and enter the records as specified in it.
#3. Create a table called countries with the following columns name, population, capital    

create database assignment; 
use assignment;
create table countries(
con_name varchar(100),
population int,
capital varchar(100)
);

#displaying table
select * from countries;

# inserting values into tables
insert into countries
values('China',1382,'Beijing'),
	  ('India',1326,'Delhi'),
	  ('United States',324,'Washington D.C.'),
	  ('Indonesia',260,'Jakarta'),
	  ('Brazil',209,'Brasilia'),
      ('Pakistan',193,'Islamabad'),
      ('Nigeria',187,'Abuja'),
      ('Bangladesh',163,'Dhaka'),
	  ('Russia',143,'Moscow'),
      ('Mexico',128,'Mexico City'),
      ('Japan',126,'Tokyo'),
      ('Philippines',102,'Manila'),
	  ('Ethiopia',101,'Addis Ababa'),
	  ('Vietnam',94,'Hanoi'),
      ('Egypt',93,'Cairo'),
      ('Germany',81,'Berlin'),
      ('Iran',80,'Tehran'),
	  ('Turkey',79,'Ankara'),
      ('Congo',	79, 'Kinshasa'),
      ('France',64,	'Paris'),
      ('United Kingdom',65,'London'),
	  ('Italy', 60,	'Rome'),
      ('South Africa',55,'Pretoria'),
	  ('Myanmar',54,'Naypyidaw');

# inserting more records to table

insert into countries
values('croatia',66,'zagreb'),
	  ('bahrain',65,'manama'),
      ('bangladesh',77,'dhaka');
      
#c) Change ‘Delhi' to ‘New Delhi'

 SET SQL_SAFE_UPDATES=0

Update countries
	set capital = 'New Delhi'
		where con_name like 'I_d_a';

#. Rename the table countries to big_countries 
rename table countries to big_countries;


#5. Create the following tables. Use auto increment wherever applicable
-- a. Product
-- product_id - primary key
-- product_name - cannot be null and only unique values are allowed 
-- description
-- supplier_id - foreign key of supplier table

create table Product(
product_id int primary key auto_increment,
product_name varchar(100) not null unique,
description_ varchar(500),
supplier_id int);

-- b. Suppliers 
create table Suppliers(
supplier_id int primary key auto_increment,
supplier_name varchar(100),
location varchar(100));

-- c. Stock
create table Stocks(
id int primary key auto_increment,
product_id int,
balanced_stock int,
foreign key (product_id) references Product(product_id)
on delete cascade
on update cascade);

alter table Product
add foreign key (supplier_id) references Suppliers(supplier_id)
on delete cascade
on update cascade ;

#6. Enter some records into the three tables.

INSERT INTO product ( product_name,description_, supplier_id )
			 VALUES ('Laptop','A laptop computer, sometimes called a notebook computer by manufacturers, is a battery- or AC-powered personal computer',Null ),
                    ('Mobile','A mobile phone, portable device for connecting to a telecommunications network in order to transmit and receive voice, etc.',Null),
                    ('Watch','A watch is a portable timepiece intended to be carried or worn by a person.',Null),
                    ('Headphone','A Headphones are a pair of padded speakers which you wear over your ears in order to listen to a recorded music.',Null);

#displaying Product table
select * from Product;

INSERT INTO suppliers (supplier_name,location )
			   Values ('HP','United States'),
                      ('Oneplus','China'),
                      ('MI','China'),
                      ('RealMe','China');
                      
#displyaing Suppliers table 
select * from suppliers;

#deleting duplicate records
delete from Suppliers
where supplier_id > 4;

update Suppliers
set supplier_id = 1000 where supplier_name = 'HP';
update Suppliers
set supplier_id = 1001 where supplier_name = 'Oneplus';
update Suppliers
set supplier_id = 1002 where supplier_name = 'MI';
update Suppliers
set supplier_id = 1003 where supplier_name = 'RealMe';

#7. Modify the supplier table to make supplier name unique and not null.
alter table Suppliers
modify supplier_name varchar(100) not null unique;

#8. Modify the emp table as follows
-- a.	Add a column called deptno
alter table emp
	add column dept_no int after emp_no;
    
#Set the value of deptno in the following order
#deptno = 20 where emp_id is divisible by 2
#deptno = 30 where emp_id is divisible by 3
#deptno = 40 where emp_id is divisible by 4
#deptno = 50 where emp_id is divisible by 5
#deptno = 10 for the remaining records.

select * from emp;
-- turing safe mode off
set sql_safe_updates = 0;
update emp 
set dept_no = 
case
when emp_no % 2 then  20
when emp_no % 3 then  30 
when emp_no % 4 then  40
when emp_no % 5 then  50
else dept_no = 10
end;

#9. Create a unique index on the emp_id column.
describe Emp_id_unique;
create unique index Emp_id_unique on emp(emp_no);

#10. Create a view called emp_sal on the emp table by selecting the following fields in the order of 
#highest salary to the lowest salary.
-- emp_no, first_name, last_name, salary
CREATE VIEW emp_sal
as select emp_no, 
       CONCAT( first_name, ' ', last_name) as Employee, salary from emp
       order by salary desc;

create view emp_sal as 
select emp_no, concat(first_name,' ',last_name) as employee , salary from emp
order by salary desc;
select * from emp_sal;


    
