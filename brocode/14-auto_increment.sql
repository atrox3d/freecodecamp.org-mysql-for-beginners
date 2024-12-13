use brocode;

drop table if exists transactions;

create table transactions(
    id int primary key auto_increment,
    amount decimal(5, 2)
);

insert into transactions
    (amount)
values
    (3.99),
    (5.99),
    (6.99),
    (7.99)
;

alter table transactions
auto_increment = 1000;


insert into transactions
    (amount)
values
    (3.99),
    (5.99),
    (6.99),
    (7.99)
;
