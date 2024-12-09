drop procedure employee_count_dept;

delimiter //                                        -- change delimiter
create procedure employee_count_dept()              -- create sp
begin                                               -- begin sql block
    select department.dept_no, department.dept_name -- actual query
        , count(employee.emp_no) as num_employees
    from department
    left join employee
    on department.dept_no = employee.dept_no
    group by department.dept_no;                    -- end query with ;
end //                                              -- end sql block with //
delimiter ;                                         -- restore delimiter

-- call sp
call employee_count_dept();

