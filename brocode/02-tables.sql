use brocode;

create table employees (
    employee_id int,
    first_name  varchar(50),
    last_name   varchar(50),
    hourly_pay  decimal(5, 2),
    hire_date   date
);

select * from employees;

rename table employees to workers;
rename table workers to employees;

-- drop table if exists employees;

alter table employees
add phone_number varchar(15);
describe employees;

insert into employees
(phone_number)
values
('hello');

alter table employees
rename column phone_number to email;    -- keeps data

alter table employees
modify column email varchar(100);       -- keeps data

alter table employees
modify column email varchar(100) after last_name;

alter table employees
modify column email varchar(100) first;

alter table employees
modify column email varchar(100) after last_name;
-- data not lost

alter table employees
drop column email;
-- data lost
