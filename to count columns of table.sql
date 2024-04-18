USE Information_Schema;

select * from columns;
select count(*) as Total_columns
from columns where table_name = "Orders" and Table_Schema like "%classic%";