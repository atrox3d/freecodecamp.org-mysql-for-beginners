-- mysql client:
show databases;
create database dbname;

show databases;

use dbname;

drop table employees;
create table if not exists employees (
    employee_id int auto_increment primary key,
    first_name varchar(255) not null,
    last_name varchar(255) not null,
    birth_date date
);

use dbname;
describe employees;
-- drop table employees;




