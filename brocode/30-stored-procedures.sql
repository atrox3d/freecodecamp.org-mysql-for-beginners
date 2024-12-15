use brocode;

-- select distinct
--     first_name, last_name
-- from transactions
-- inner join customers 
-- on 
--     transactions.customer_id = customers.id;

drop procedure if exists get_customers;

delimiter //
create procedure if not exists get_customers()
begin
    select * from customers;
end //
delimiter ;

call get_customers();


drop procedure if exists find_customer;
delimiter //
create procedure if not exists find_customer(IN id int)
begin
    select * from customers
    where customers.id = id;
end //
delimiter ;

call find_customer(2);

drop procedure if exists find_customer;
delimiter //
create procedure if not exists find_customer(
                        in fname varchar(50),
                        in lname varchar(50)
)
begin
    select * from customers
    where first_name = fname
    and   last_name = lname;
end //
delimiter ;

call find_customer('larry', 'lobster');

