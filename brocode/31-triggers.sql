use brocode;

-- add salary to employees
alter table employees
add column salary decimal(10, 2) after hourly_pay;
select * from employees;

-- compute salary
update employees
set salary = hourly_pay * 2080;
select * from employees;

-- add trigger to compute salary on update
drop trigger if exists before_hourly_pay_update;
delimiter //
create trigger if not exists before_hourly_pay_update
before update on employees
for each row
begin
    set new.salary = (new.hourly_pay * 2080);
end //
delimiter ;
show triggers;

-- update employees pay to trigger
update employees
set hourly_pay = 50
where employee_id = 1;
select * from employees;

update employees
set hourly_pay = hourly_pay +1;

select * from employees;


-- create trigger to backup employee on deletion

drop table if exists backup_employees;

create table if not exists backup_employees
like employees;

drop trigger if exists before_delete_employee;
delimiter //
create trigger if not exists before_delete_employee
before delete on employees
for each row
begin
    -- create table if not exists backup_employees
    -- like employees;
    delete from backup_employees
    where employee_id = old.employee_id;

    insert into backup_employees
    select *
    from employees
    where employee_id = old.employee_id;
end //
delimiter ;

-- delete to triger
delete from employees
where employee_id = 6;

-- create trigger to compute salary on insert
delimiter //
create trigger if not exists before_hourly_pay_insert
before insert on employees
for each row
begin
    set new.salary = (new.hourly_pay * 2080);
end //
delimiter ;

-- set backup employee salary to null
update backup_employees
set salary = null;

-- restore employeem, fire trigger
insert into employees
select * from backup_employees;

show triggers;

/********************************************************/

describe expenses;
select * from expenses;

alter table expenses
drop column expense_id;

alter table expenses
add expense_id int primary key first;

alter table expenses
rename column expense to expense_name;

alter table expenses
rename column amount to expense_total;

alter table expenses
modify expense_name varchar(50);

describe expenses;

insert into expenses
values
    (1, 'salaries', 0),
    (2, 'supplies', 0),
    (3, 'taxes', 0);

select * from expenses;

update expenses
set expense_total = (
    select sum(salary) from employees
)
where expense_name = 'salaries';

delimiter //
create trigger if not exists after_salary_delete
after delete on employees
for each row
begin
    update expenses
    set expense_total = expense_total - old.salary
    where expense_name = 'salaries';
end //
delimiter ;

delete from employees
where employee_id = 6;

delimiter //
create trigger if not exists after_salary_insert
after insert on employees
for each row
begin
    update expenses
    set expense_total = expense_total + new.salary
    where expense_name = 'salaries';
end //
delimiter ;

insert into employees
select * from backup_employees;

select * from expenses;

-- insert into employees
-- values (6, 'Sheldon', 'Plankton', 10, NULL, 'janitor', '2023-01-07', 5);

/********************************************************/
