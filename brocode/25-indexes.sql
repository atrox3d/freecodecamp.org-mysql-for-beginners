use brocode;

select * from transactions;
select * from customers;

describe customers;
show indexes from customers;

create index last_name_idx
on customers(last_name);
show indexes from customers;

-- alter table customers
-- drop index last_name_idx;

select * from customers
where last_name = 'puff';

select * from customers
where first_name = 'poppy';

/* TEST SPEED WITH INDEXES */
use employee;
show tables;
select * from employee;
show indexes from employee;
-- 86 ms
select* from employee
where first_name = 'sumant';

-- 5 ms
select* from employee
where last_name = 'schade';

use brocode;

create index lastname_firstname_idx
on customers(last_name, first_name);
show indexes from customers;

