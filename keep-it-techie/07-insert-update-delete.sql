select * from department;

insert into department (dept_no, dept_name)
values ('d010', 'Technology');

insert into department
values ('d011', 'delete me');

delete from department
where dept_no = 'd011';

update department
set dept_name = 'Helpdesk'
where dept_no = 'd010';

delete from department
where dept_no = 'd010';

select * from department;
