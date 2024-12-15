use brocode;

-- locate poppy puff
select * from transactions
where customer_id = 4;

-- try to delete poppy puff
-- ERROR: cannot delete or update a parent row
delete from customers
where id = 4;

-- locate fk_customer_id
show indexes from transactions;

-- backup poppy puff
drop table if exists backup_customers;

create table backup_customers as
select * from customers
where id = 4;

select * from backup_customers;

-- disable fk check
set foreign_key_checks = 0;
-- try to delete poppy puff
-- ok
delete from customers
where id = 4;

-- check deletion
select * from customers
where id = 4;

-- locate orphan transaction
select * from transactions
where customer_id = 4 or id = 1005;

-- reenable fk check
set foreign_key_checks = 1;

-- restore poppy puff
insert into customers
select * from backup_customers;

select * from customers
where id = 4;

/****************************************************
 *
 *  change fk on delete to set null
 *
 *****************************************************/
-- check indexes
show indexes from transactions;
-- check constraints
alter table transactions
add constraint fk_customer_id
foreign key(customer_id) references customers(id)
on delete set null;

-- delete fk_customer_id
alter table transactions
drop foreign key fk_customer_id;

-- recreate fk set null
alter table transactions
add constraint fk_customer_id
foreign key(customer_id) references customers(id)
on delete set null
;

-- check constraints
select *                                -- list constraints
from information_schema.table_constraints
where 
    constraint_schema = 'brocode'
    and table_name = 'transactions';

-- check overall table
describe transactions;

-- check fk creation
show create table transactions;

-- try to delete poppy puff
-- ok
delete from customers
where id = 4;

-- check deletion
select * from customers
where id = 4;

-- locate orphan transaction
-- verify customer_id is null
select * from transactions
where 
        customer_id = 4
    or  customer_id is null
    and id = 1005;

/****************************************************
 *
 *  change fk on delete cascade
 *
 *****************************************************/

-- restore poppy puff
insert into customers
select * from backup_customers;

select * from customers
where id = 4;

-- delete fk_customer_id
alter table transactions
drop foreign key fk_customer_id;

-- recreate fk cascade
alter table transactions
add constraint fk_customer_id
foreign key(customer_id) references customers(id)
on delete cascade
;

-- check constraints
select *                                -- list constraints
from information_schema.table_constraints
where 
    constraint_schema = 'brocode'
    and table_name = 'transactions';

-- restore customer_id on transactions
update transactions
set customer_id = 4
where id = 1005;

-- backup transaction
create table backup_transactions as
select * from transactions
where customer_id = 4;

-- check backup
select * from backup_transactions;

-- try to delete poppy puff
delete from customers
where id = 4;

-- check transaction is deleted
select *
from transactions
where customer_id = 4;

-- try to restore transaction
-- ERROR: cannot add or update
insert into transactions
select * from backup_transactions;

-- missing parent
select * from customers where id = 4;

-- restore poppy puff
insert into customers
select * from backup_customers;

-- try to restore transaction
-- ok
insert into transactions
select * from backup_transactions;

select * from transactions
where customer_id = 4;
