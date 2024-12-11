use brocode;

-- update sheldon, hired
update employees
set hourly_pay = 10.50,
    hire_date = '2023-01-07'
where employee_id = 6;

-- backup id and pay to backup table
create table backup
as select employee_id, hourly_pay
from employees;

-- reset pay (fake error)
update employees
set hourly_pay = 0;

-- restore pay based on id
UPDATE employees INNER JOIN backup
ON employees.employee_id = backup.employee_id
SET employees.hourly_pay = backup.hourly_pay;


-- backup sheldon to backup table
drop table if exists backup;
create table backup
as select *
from employees
where employee_id = 6;

-- delete sheldon
delete from employees
where employee_id = 6;

-- restore sheldon
insert into employees
select * from backup;
