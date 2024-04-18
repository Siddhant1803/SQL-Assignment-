select "2022-10-03 15:35:7" as result;

#date
select date("2022-10-03 15:35:7") as result;

#time
select time("2022-10-03 15:35:7") as result;

#current_timestamp
select current_timestamp() as result;
select current_date() as result;
select current_time() as result;
#now
select now() as result;

#date_add
select date_add(now(), interval 5 month) as result;
select date_add(now(), interval -5 month) as result;

-- adding hours
select date_add(now(), interval 4 hour) as result;

select date_add(now(), interval 4 day) as result;

select now() as result;
#date_foramt
select date_format(now(),"%d %m %Y") as result; -- %Y represents full year in the form YYYY
select date_format(now(),"%D %M %Y %h:%i:%s %p") as result; -- %M represents full name of month and %D returns th after date
select date_format(now(),"%D %b %Y" ) as result; -- %b represents short name of month
select date_format(now(),"%b %Y") as result; -- returns short month and year in format YYYY

#datediff
select datediff("2023-01-01","2022-10-01") as result;

#timestampdiff
select timestampdiff(month,"2022-10-01","2023-01-01") as result;
select timestampdiff(year,"2001-03-18",now()) as result;
select timestampdiff(hour,"2001-03-18",now()) as result;