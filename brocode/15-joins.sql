use brocode;

-- not every transaction has a customer_id
insert into transactions (amount, customer_id)
values (1.00, null);
select * from transactions;

-- not every customer has  a transaction
insert into customers (first_name, last_name)
values('poppy', 'puff');
select * from customers;

-- missing row for the transaction with null customer_id
-- missing row for the customer poppy puff
select t.id, amount, first_name, last_name
from transactions t
inner join customers c
on t.customer_id = c.id
order by t.id;

-- row with nulls
-- missing row for the customer poppy puff
select *
from transactions t
left join customers c
on t.customer_id = c.id
order by t.id;

-- missing row with null customer_id
-- row for the customer poppy puff
select *
from transactions t
right join customers c
on t.customer_id = c.id
;
