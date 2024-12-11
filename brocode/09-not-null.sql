use brocode;

alter table products
modify price decimal(4, 2) not null;

show index from products;           -- list indexes
show create table products;         -- list constraints
SELECT *                            -- check not null constraint
FROM information_schema.COLUMNS
WHERE
    TABLE_SCHEMA = 'brocode'
    and table_name = 'products'
    and is_nullable = 'no'
;

-- column price cannot be null
insert into products
values (104, 'cookies', null);

