use brocode;

select * from employees;

select last_name, first_name from employees;

select * from employees where employee_id = 4;
select * from employees where first_name = 'Spongebob';
select * from employees where hourly_pay >= 15;
select * from employees where hire_date is /* not */ null;


