use brocode;

select * from transactions;

alter table transactions
add order_date date;

insert into transactions
values
    (1005, 2.49, 4, '2023-01-03'),
    (1006, 5.48, null, '2023-01-03');

update transactions
set order_date = '2023-01-01'
where id <=1001;

update transactions
set order_date = '2023-01-02'
where id between 1002 and 1003;

select sum(amount), order_date
from transactions
group by order_date;

select max(amount), order_date
from transactions
group by order_date;

select min(amount), order_date
from transactions
group by order_date;

select avg(amount), order_date
from transactions
group by order_date;

select count(amount), order_date
from transactions
group by order_date;

select
    sum(amount) as sum,
    max(amount) as max,
    min(amount) as min,
    avg(amount) as avg,
    count(amount) as count,
    order_date
from transactions
group by order_date;

select * from transactions;

select
    customer_id,
    sum(amount) as sum,
    max(amount) as max,
    min(amount) as min,
    avg(amount) as avg,
    count(amount) as count
from transactions
group by customer_id;

select
    count(amount) as visits,
    customer_id
from transactions
    where customer_id is not null   --filter before grouping
group by customer_id
    -- where visits > 1             -- error
    having visits > 1               -- filter after grouping
    -- and customer_id is not null  -- filter after grouping
;

