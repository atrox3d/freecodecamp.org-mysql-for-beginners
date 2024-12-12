use brocode;

create table income(
    name varchar(20),
    amount decimal(6, 2)
);
alter table income
modify column amount decimal(10, 2);

insert into income
values
    ('orders', 1000000.00),
    ('merchandise', 50000.00),
    ('services', 125000.00)
;
select * from income;

create table expenses(
    name varchar(20),
    amount decimal(10, 2)
);

insert into expenses
values
    ('wages', -250000.00),
    ('tax', -50000.00),
    ('repairs', -15000.00)
;

select * from income
union
select * from expenses;

-- the used select statements have a different number of columns
select * from employees
union
select * from customers;


-- no duplicates
select first_name, last_name from employees
union
select first_name, last_name from customers
;

insert into customers
select 
    (select max(id) +1 from customers), 
    first_name, last_name from employees
where first_name = 'sheldon';

select * from customers;

-- no sheldon duplicates
select first_name, last_name from employees
union
select first_name, last_name from customers
;

-- sheldon duplicates
select first_name, last_name from employees
union all
select first_name, last_name from customers
;

delete from customers
where first_name = 'sheldon';





