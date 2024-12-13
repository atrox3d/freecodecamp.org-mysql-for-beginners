use brocode;

create table customers(
    id int primary key auto_increment,
    first_name varchar(50),
    last_name varchar(50)
);

insert into customers
    (first_name, last_name)
values
    ('fred', 'fish'),
    ('larry', 'lobster'),
    ('bubble', 'bass')
;

select * from customers;

drop table if exists transactions;
create table transactions(
    id int primary key auto_increment,
    amount decimal(5, 2),
    customer_id int,
    foreign key(customer_id) references customers(id)
);

describe transactions;
select *                                -- list constraints
from information_schema.table_constraints
where 
    constraint_schema = 'brocode'
    and table_name = 'transactions'
;
show create table transactions;
select *
from information_schema.referential_constraints
where constraint_schema = 'brocode';

alter table transactions
drop foreign key transactions_ibfk_1;

alter table transactions
add constraint fk_customer_id
foreign key(customer_id) references customers(id);

/*************************************************/
delete from transactions;
select * from transactions;
alter table transactions
auto_increment = 1000;

insert into transactions (amount, customer_id)
values  (4.99, 3),
        (2.89, 2),
        (3.38, 3),
        (4.99, 1)
;
select * from transactions;

select * from
transactions t inner join customers c
on t.customer_id = c.id
order by t.INDEX;

-- cannot delete or upate a parent row from customers
-- because transactions has fk on customers.id
-- the solution is to delete or update customer_id on transactions
-- or add ON DELETE CASCADE to the foreign key
delete from customers
where id = 3;

