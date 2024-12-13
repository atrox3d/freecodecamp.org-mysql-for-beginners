use brocode;

select * from transactions;

select
    sum(amount),
    order_date
from transactions
group by order_date with rollup;

select
    count(id),
    order_date
from transactions
group by order_date with rollup;

select
    count(id),
    order_date
from transactions
group by order_date with rollup;

select
    count(id) as '# of orders',
    customer_id
from transactions
group by customer_id with rollup;

select * from employees;
select 
    employee_id,
    sum(hourly_pay),
    avg(hourly_pay),
    max(hourly_pay),
    min(hourly_pay)
from employees
    group by employee_id with rollup;


select * from transactions;
select
    sum(amount) as sum,
    max(amount) as max,
    min(amount) as min,
    avg(amount) as avg,
    count(amount) as count,
    order_date
from transactions
group by order_date;
/*
    rollup with other aggregate functions
    applies the function to the original records,
    not to the aggregate records
*/
select
    sum(amount) as sum,
    max(amount) as max,
    min(amount) as min,
    avg(amount) as avg,
    count(amount) as count,
    order_date
from transactions
group by order_date with rollup;
/*
7.88	4.99	2.89	3.940000	2	2023-01-01
8.37	4.99	3.38	4.185000	2	2023-01-02
8.97	5.48	1.00	2.990000	3	2023-01-03
25.22	5.48	1.00	3.602857	7	
*/
-- same as the rollup row
select
    sum(amount) as sum,
    max(amount) as max,
    min(amount) as min,
    avg(amount) as avg,
    count(amount) as count
from transactions;
/*
25.22	5.48	1.00	3.602857	7
*/