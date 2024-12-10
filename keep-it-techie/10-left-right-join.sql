use employee;

-- get all records of employee and dept_name from department
-- returns null instead of excludinfìd missing employee.dept_no
select emp_no, first_name, last_name, department.dept_name
from employee
left join department
on employee.dept_no = department.dept_no;

-- get all records that have employee.dept_no NOT NULL
-- because the leading table is the RIGHT, department
-- same result as inner join in this case
select emp_no, first_name, last_name, department.dept_name
from employee
right join department
on employee.dept_no = department.dept_no;


select department.dept_no, department.dept_name
    , count(employee.emp_no) as num_employees
from department
left join employee
on department.dept_no = employee.dept_no
group by department.dept_no
    -- , department.dept_name
order by department.dept_no
;