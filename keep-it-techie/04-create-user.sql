select user, host from mysql.user;

create user if not exists 'dbuser'@'localhost' identified by 'password';
create user if not exists 'dbuser2'@'%' identified by 'password';
select user, host, authentication_string from mysql.user;
alter user if exists 'dbuser2'@'%' identified by 'password123';
select user, host, authentication_string from mysql.user;

drop user if exists 'dbuser'@'localhost';
drop user if exists 'dbuser2'@'%';
select user, host, authentication_string from mysql.user;


create user if not exists 'dbuser'@'%' identified by 'password';
create user if not exists 'docker'@'localhost' identified by 'password';
select user, host, authentication_string from mysql.user;

show databases;