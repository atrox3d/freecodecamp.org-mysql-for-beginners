select emp_no, dept_no
from employee.employee
where dept_no is null
;

use employee;
select database();
select *
from employee
inner join department
on employee.dept_no = department.dept_no
-- limit 20, 10
;
select * from department;

select emp_no, first_name, last_name, department.dept_name
from employee
inner join department
on employee.dept_no = department.dept_no
;
