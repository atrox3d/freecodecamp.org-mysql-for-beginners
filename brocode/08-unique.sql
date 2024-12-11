use brocode;

-- create table
create table products(
    product         int,
    product_name    varchar(25) unique,
    price           decimal(4, 2)
);
select * from products;             -- check table

show create table products;         -- show definition with ndx

alter table products
drop index product_name;            -- remove index

alter table products                -- readd unique ndx
add constraint unique(product_name);
show create table products;
show index from products;           -- list indexes

SELECT * 
FROM information_schema.statistics
where table_name = 'products';      -- check ndxs

alter table products
drop index product_name
-- drop index product_name_2
;
show index from products;           -- list indexes

/************************************************/

alter table products                -- readd unique ndx
add constraint unique(product_name);
show index from products;           -- list indexes

-- duplicate entry fries
insert into products
values
    (100, 'hamburger', 3.99),
    (101, 'fries', 1.89),
    (102, 'soda', 1.00),
    (103, 'ice cream', 1.49),
    (101, 'fries', 1.75)
;

insert into products
values
    (100, 'hamburger', 3.99),
    (101, 'fries', 1.89),
    (102, 'soda', 1.00),
    (103, 'ice cream', 1.49)
;
select * from products;
