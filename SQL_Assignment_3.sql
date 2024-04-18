# 1. Write a stored procedure that accepts the month and year as inputs and prints the ordernumber, 
# orderdate and status of the orders placed in that month. Example:  call order_status(2005, 11);

DELIMITER //

CREATE PROCEDURE ORDER_STATUS (IN order_year INT, IN order_month INT)

BEGIN
SELECT orderNumber,orderDate,status 
FROM orders
WHERE (YEAR(orderDate) = order_year) AND
      (MONTH(orderDate)  = order_month);
END //

CALL ORDER_STATUS(2005, 11);
CALL ORDER_STATUS(2004, 11);
-- DROP PROCEDURE ORDER_STATUS;
-- DESCRIBE orders;

#2.a.Write function that takes the customernumber as input and returns the purchase_status based on the following criteria.
#[table:Payments]
#if the total purchase amount for the customer is < 25000 status = Silver, amount between 25000 and 50000, status = Gold
#if amount > 50000 Platinum

DELIMITER //
CREATE PROCEDURE PURCHASE ( IN p_customerNumber INT, OUT p_purchase_status VARCHAR(100))
BEGIN 
DECLARE amt DECIMAL(10,2);
SELECT amount INTO amt FROM payments 
WHERE customerNumber = p_customerNumber 
GROUP BY customerNumber;

IF amt < 25000 THEN 
  SET p_purchase_status = "Silver";
ELSEIF amt BETWEEN 25000 AND 50000 THEN
  SET p_purchase_status = "Gold";
ELSE
  SET p_purchase_status = "Platinum";
END IF;

END //

CALL PURCHASE (103,@abc);
SELECT @abc as RESULT;
CALL PURCHASE (112,@def);
SELECT @def as RESULT_1;

#DESCRIBE payments;
DROP PROCEDURE PURCHASE;

#b. Write a query that displays customerNumber, customername and purchase_status from customers table.

select c.customerNumber,
     c.customerName,
       o.status
  from customers c
    LEFT JOIN orders o
    USING (customerNumber);

#3. Replicate the functionality of 'on delete cascade' and 'on update cascade' using triggers on movies and rentals tables. 
# Note: Both tables - movies and rentals - don't have primary or foreign keys. Use only triggers to implement the above.

# ON DELETE CASCADE
DELIMITER //
CREATE TRIGGER delete_cascade AFTER DELETE ON movies FOR EACH ROW
BEGIN
UPDATE rentals
SET movieid = id WHERE movieid = old.id;
END // 

-- adding a new row into movies and rentals to see working of above code
INSERT INTO movies VALUES (11,"Titanic","Love_story");

INSERT INTO rentals VALUES (9,"Yash","Shinde",11);

SET sql_safe_updates= 0;
DELETE FROM  movies
  WHERE movies.id = 11;
  
# ON UPDATE CASCADE

DELIMITER //
CREATE TRIGGER update_cascade AFTER UPDATE ON movies FOR EACH ROW
BEGIN 
UPDATE rentals 
SET movieid = OLD.id 
WHERE movieid = NEW.id; 
END //

INSERT INTO movies ( id,title,category )
      Values ( 12, 'The Dark Knight', 'Action/Adventure'); 

UPDATE rentals
  SET movieid = 12
    WHERE memid = 9;

UPDATE movies
  SET id = 11
    WHERE title regexp 'Titanic';

select *
  from movies;

select *
  from rentals;

#4. Select the first name of the employee who gets the third highest salary. [table: employee]
SELECT fname FROM employee ORDER BY salary DESC LIMIT 2,1; 

#5.Assign a rank to each employee based on their salary. The person having the highest salary has rank 1. [table: employee]
SELECT*, 
	DENSE_RANK() OVER (ORDER BY salary DESC) AS rank_salary FROM employee;







