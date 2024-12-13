use brocode;

update employees
set hourly_pay = 10.00
where first_name = 'sheldon';

select
    first_name,
    last_name,
    hourly_pay,
    (select avg(hourly_pay) from employees) as avg_pay
from employees;

select
    first_name,
    last_name,
    hourly_pay
from employees
    where
    hourly_pay > (select avg(hourly_pay) from employees)
;

select * from customers;
select * from transactions;

-- find all customers thad do not have transactions
select first_name, last_name
from customers
where id not in (
    select distinct customer_id
    from transactions
    where customer_id is not null
);

