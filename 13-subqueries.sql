use employee;

select *                        -- MAIN query
from employee                   -- MAIN query
where dept_no = (               -- MAIN query
    select dept_no              -- SUB query
    from department             -- SUB query
    where dept_name = 'Sales'   -- SUB query
);                              -- SUB query
