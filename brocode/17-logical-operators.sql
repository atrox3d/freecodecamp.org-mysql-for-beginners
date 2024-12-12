use brocode;

alter table employees
add column job varchar(25)
after hourly_pay;

select * from employees;

update employees
set job = 'manager'
where employee_id = 1;

update employees
set job = 'cashier'
where employee_id = 2;

update employees
set job = 'cook'
where employee_id between 3 and 4;

update employees
set job = 'asst. manager'
where employee_id = 5;

update employees
set job = 'janitor'
where employee_id = 6;

select * from employees;

select *
from employees
where 
    job = 'cook'
    and hire_date < '2023-01-05' 
;

select *
from employees
where 
    job = 'cook' 
    or job = 'cashier'
;

select *
from employees
where 
    not job = 'manager'     -- same
    and job != 'manager'    -- same
;

select *
from employees
where  
    hire_date between '2023-01-04'
    and '2023-01-07'
;

select *
from employees
where  
    job in ('cook', 'cashier', 'janitor')
;
