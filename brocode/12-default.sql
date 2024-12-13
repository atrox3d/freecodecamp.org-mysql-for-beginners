use brocode;

select * from products;

insert into products
values
    (104, 'straw',  0),
    (105, 'napkin', 0),
    (106, 'plastic fork', 0),
    (107, 'plastic spoon', 0);

select * from products;

alter table products
rename column x to id;

delete from products
where id >= 104;

alter table products
alter price set DEFAULT 0;

SELECT *                            -- check not null constraint
FROM information_schema.COLUMNS
WHERE
    TABLE_SCHEMA = 'brocode'
    and table_name = 'products'
    and column_name = 'price'
;

insert into products
(id, product_name)
values
    (104, 'straw'),
    (105, 'napkin'),
    (106, 'plastic fork'),
    (107, 'plastic spoon');

select * from products;

/***************************************/

create table transactions(
    id int,
    amount decimal(5, 2),
    date datetime default now()
);

insert into transactions
(id, amount)
values
    (1, 4.99),
    (2, 7);

select * from transactions;