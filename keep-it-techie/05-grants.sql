-- as root

grant all privileges on *.* to 'dbuser'@'%';
revoke all privileges on *.* from 'dbuser'@'%';

grant select, insert, delete on employee.department to 'dbuser'@'%';

show grants for 'dbuser'@'%';
