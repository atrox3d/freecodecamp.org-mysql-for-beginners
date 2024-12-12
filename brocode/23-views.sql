use brocode;

create view employee_attendance as
select first_name, last_name from employees;

select * 
from employee_attendance
order by last_name
;

alter table customers
add email varchar(50);

update customers
set email = concat(
    left(first_name, 1),
    last_name,
    '@gmail.com'
);
select * from customers;

create view customer_emails as
select email
from customers;
select * from customer_emails;

insert into customers
values
    (5, 'pearl', 'krabs', null, 'pkrabs@gmail.com')
;

select * from customer_emails;
