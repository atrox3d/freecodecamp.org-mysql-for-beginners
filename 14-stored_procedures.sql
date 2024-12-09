drop procedure employee_count_dept;

delimiter //
create procedure if not exists employee_count_dept()
begin
    select department.dept_no, department.dept_name
        , count(employee.emp_no) as num_employees
    from department
    left join employee
    on department.dept_no = employee.dept_no
    group by department.dept_no;
-- from mysql terminal
end //
delimiter ;

call employee_count_dept();

