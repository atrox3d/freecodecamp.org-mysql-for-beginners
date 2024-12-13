use brocode;

drop table if exists transactions;
create table transactions (
    id int primary key,
    amount decimal(5, 2)
);

show indexes from transactions;
describe transactions;
show create table transactions;
select *                                -- list constraints
from information_schema.table_constraints
where 
    constraint_schema = 'brocode'
    and table_name = 'transactions'
;

insert into transactions
values
    (1000, 4.99);

insert into transactions
values
    (1001, 3.38);

-- duplicate entry 1001 for key transactions.PRIMARY
insert into transactions
values
    (1001, 3.38);

-- column id cannot be null
insert into transactions
values
    (null, 3.38);





alter table transactions
add constraint
primary key(id);