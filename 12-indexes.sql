show indexes from employee;

create index idx_lastname
on employee(last_name);

alter table employee
drop index idx_lastname;

select *
from employee
where last_name = 'Baaz';

/*******************
    cons of indexes:
    - slower insert, update
    - disk space
    - memory
*******************/

