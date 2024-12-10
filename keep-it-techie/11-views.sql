use employee;

create view employee_gender as
select first_name, last_name, gender
from employee;

show tables;

select *
from employee_gender;

drop view if exists employee_gender;
show tables;

alter table department
add column email varchar(50);
select * from department;

update department
-- set email = 'marketing@abc.com'
-- where dept_no = 'd001'
-- set email = 'fin@abc.com'
-- where dept_no = 'd002'
-- set email = 'prod@abc.com'
-- where dept_no = 'd004'
-- set email = 'dev@abc.com'
-- where dept_no = 'd005'
-- set email = 'qual@abc.com'
-- where dept_no = 'd006'
-- set email = 'sales@abc.com'
-- where dept_no = 'd007'
set email = 'cust@abc.com'
where dept_no = 'd009'
;

select * from department;

create view dept_email as
select dept_no, email
from department;
show tables;

select * from dept_email;

insert into department
(dept_no, dept_name, email)
values
('d010', 'Helpdesk', 'help@abc.com');
select * from dept_email;