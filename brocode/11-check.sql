use brocode;

alter table employees
add constraint chk_hourly_pay check(hourly_pay >= 10);
show indexes from employees;            -- list indexes
show create table employees;            -- list constraints

select *                                -- list constraints
from information_schema.table_constraints
where constraint_schema = 'brocode';

-- check constraint violation
insert into employees
values
    (10, 'someone', 'something', 9, now());

alter table employees
drop check chk_hourly_pay;

select *                                -- list constraints
from information_schema.table_constraints
where constraint_schema = 'brocode';
