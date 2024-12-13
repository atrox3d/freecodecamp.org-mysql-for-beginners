use brocode;

alter table customers
add referral_id int;

select * from customers;

update customers set referral_id = 1 
where id = 2;
update customers set referral_id = 2 
where id in (3, 4);

select 
    a.first_name,
    a.last_name,
    if(a.referral_id is null, 'NO ONE',
    concat_ws(' ', b.first_name, b.last_name)) as referral
from customers as a
left join customers as b
on a.referral_id = b.id;

alter table employees
add supervisor_id int;
select * from employees;

update employees
set supervisor_id = 5
where employee_id in (2, 3, 4, 6);

update employees
set supervisor_id = 1
where employee_id = 5;


select 
    a.first_name,
    a.last_name,
    concat_ws(' ', b.first_name, b.last_name) as referral
from employees as a
left join employees as b
on a.supervisor_id = b.employee_id;



