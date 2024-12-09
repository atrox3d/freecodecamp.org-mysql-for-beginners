-- check table structure
describe employee.employee;
describe employee.department;

-- add field dept_no to employee
alter table employee.employee
add column dept_no char(4);
describe employee.employee;

-- remove field dept_no from employee
alter table employee.employee
drop column dept_no;
describe employee.employee;

-- add foreign fk_dept_no key to employee table
-- referencing department.dept_no
-- into the new field employee.dept_no
alter table employee.employee   -- add fk to employee
add constraint fk_dept_no       -- name constraint
foreign key(dept_no)            -- local dest field of fk
references department(dept_no)  -- external source field of fk
;
describe employee.employee;

show create table employee.employee;
show create table employee.department;

-- alter table employee.employee
-- drop foreign key fk_dept_no;
-- describe employee.employee;

--- selects a random dept_no value from department
select dept_no from employee.department -- test
order by rand()                         -- multine
limit 1                                 -- comment
;

--- nested query to add random dept_no to employees: 3.9s affected: 300024
update employee.employee        -- dest table to update
set dept_no = (                 -- dest field to update with the result of the subquery
    select dept_no              -- subquery: select source field
    from employee.department    -- source table
    order by rand()             -- order records randomly
    limit 1                     -- get only the first
);
select * from employee.employee limit 20;