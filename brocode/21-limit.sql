use brocode;

select * from customers
limit 1;

select * from customers
order by last_name
-- desc
limit 1;

select * from customers
limit 3, 2;
