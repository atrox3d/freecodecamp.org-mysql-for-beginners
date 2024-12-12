use brocode;

select count(amount) as "today's transactions"
from transactions;

select max(amount) as "greater transaction"
from transactions;

select min(amount) as "lower transaction"
from transactions;

select avg(amount) as "average transaction"
from transactions;

select sum(amount) as "total"
from transactions;

select concat_ws(' ', first_name, last_name)
as full_name
from employees;



