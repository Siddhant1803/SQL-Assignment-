#ASCII
select ascii("apple") as result;

# CHAR_LENGTH
select char_length("Apple") as result;

# Format
select format(12443.8989,2) as result;

# Insert
select insert("google",1,0,"WWW.") as result;

#INStr
select instr("MySQL","ql") as result;

#upper/lower
select upper("siddhant") as result;
select lower(upper("siddhant")) as result;


# left / right
select left("United States of America",13) as result;
select right("United States of America",7) as result;

#Lpad/Rpad
select lpad("Siddhant sonawane", char_length("Siddhant sonawane")+3,"Mr.") as result;
select rpad("Siddhant sonawane", char_length("Siddhant sonawane")+3,"man") as result;

#Ltrim/Rtrim/Trim
select rtrim("             abc                   ") as result;
select ltrim("             abc                   ") as result;
select trim("             abc                   ") as result;

# substring
select substring("united states of america",8) as result;
select substring("united states of america",8,6) as result;

# substring_index
select substring_index("www.google.com",".",-1) as result;
select substring_index("www.google.com",".",2) as result;

#replace
select replace("I learn MYSQL","MYSQL","POWER BI") as result; 

# reverse
select reverse("MYSQL") as result;
