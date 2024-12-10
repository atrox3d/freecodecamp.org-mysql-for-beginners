select * from employee;

select emp_no, first_name, last_name
from employee
where last_name = 'Bamford';

select first_name, gender
from employee
where last_name = 'Bamford';

select first_name, last_name, emp_no
from employee
where last_name = 'Bamford'
    and gender = 'F';

select emp_no, first_name, last_name, hire_date
from employee
order by hire_date
limit 20;

select emp_no, first_name, last_name, birth_date,
    hire_date
from employee
where birth_date like '1965%'
order by hire_date
limit 20;
