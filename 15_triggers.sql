use employee;

-- create a log for updates on employee
create table employee_audit(
    audit_id int auto_increment primary key,
    dept_no int,
    action varchar(50),
    action_date TIMESTAMP
);
-- fix column wrong data type
alter table employee_audit
modify column dept_no char(4);

-- check everything
show tables;
describe employee_audit;
select * from employee_audit;

-- create trigger
delimiter //                            -- change delimiter
create trigger employee_audit_trigger   -- create trigger
after update on employee                -- when to trigger
for each row                            -- loop through updated rows?
begin                                   -- begin sql code
    insert into employee_audit          -- add record to audit
    (dept_no, action, action_date)
    values
    (new.dept_no, 'UPDATE', NOW());     -- new is the new record
end //                                  -- end sql code
delimiter ;                             -- restore delimiter

-- check if created succesfully
show triggers;

-- fire trigger with one record
update employee
set dept_no = 'd010'
where emp_no = 10001;

select * from employee_audit;

-- fire trigger multiple times
update employee.employee        -- dest table to update
set dept_no = (                 -- dest field to update with the result of the subquery
    select if(
        floor(rand()*(2))+1 = 1,                    -- 1 or 2
        null,                                       -- null
        ( 
            select dept_no from employee.department -- get random
            order by rand()                         -- dept_no from
            limit 1                                 -- department
        )
    )
);

-- check trigger table
select * from employee_audit;
