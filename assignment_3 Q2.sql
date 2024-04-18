#2.a.Write function that takes the customernumber as input and returns the purchase_status based on the following criteria.[table:Payments]
#if the total purchase amount for the customer is < 25000 status = Silver, amount between 25000 and 50000, status = Gold
#if amount > 50000 Platinum

DELIMITER //
CREATE FUNCTION PURCHASE_STATUS(credit DECIMAL(10,2))
RETURNS VARCHAR(50) DETERMINISTIC
BEGIN 
DECLARE STATUS VARCHAR(50);
IF credit < 25000 THEN 
SET STATUS = "Silver";
ELSEIF credit BETWEEN 25000 AND 50000 THEN 
SET STATUS = "Gold";
ELSEIF credit > 50000 THEN 
   SET STATUS = "Platinum";
END IF ;
RETURN(STATUS);

END //


#b. Write a query that displays customerNumber, customername and purchase_status from customers table.
SELECT customerNumber,customerName,PURCHASE_STATUS(creditLimit) AS purchase_status FROM customers;