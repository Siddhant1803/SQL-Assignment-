# ROW_NUMBER
select row_number() over() as Sr_No,
	   orderNumber,quantityOrdered
       from orderdetails;
       
# Rank/ Dense_Rank

select rank() over(order by quantityOrdered desc) as ranking,quantityOrdered from orderdetails;

select dense_rank() over(order by quantityOrdered desc) as dense_ranking,quantityOrdered from orderdetails;

# LAG
select 
  lag(quantityOrdered,1) over(partition by orderNumber) as prev_qt,
  quantityOrdered,
  orderNumber
  from orderdetails;
  
#LEAD
select 
  lead(quantityOrdered,1) over(partition by orderNumber) as prev_qt,
  quantityOrdered,
  orderNumber
  from orderdetails;
  
#FIRST/LAST/NTH VALUE
select orderNumber,
       quantityOrdered,
       first_value(quantityOrdered) over(partition by orderNumber) as F_val
       from orderdetails;
       
select orderNumber,
       quantityOrdered,
       last_value(quantityOrdered) over(partition by orderNumber) as F_val
       from orderdetails;

select orderNumber,
       quantityOrdered,
       nth_value(quantityOrdered,2) over(partition by orderNumber) as F_val
       from orderdetails;
    
    # to get 2nd highest 
select orderNumber,
       quantityOrdered,
       nth_value(quantityOrdered,2) over(partition by orderNumber order by quantityOrdered desc) as second_highest
       from orderdetails;
       
