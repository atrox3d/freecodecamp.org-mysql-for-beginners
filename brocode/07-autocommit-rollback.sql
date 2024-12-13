use brocode;

select @@autocommit;            -- check autocommit value

set autocommit = on;            -- enable autocommit
select @@autocommit;            -- check autocommit value

set autocommit = off;           -- disable autocommit
select @@autocommit;            -- check autocommit value

drop table if exists backup;    -- start fresh
create table backup as          -- backup employee
select * from employees;
select * from backup;           -- check backup

commit;                         -- save point
delete                          -- delete backup data
from backup;
select * from backup;           -- check backup

rollback;                       -- rollback deletion
select * from backup;           -- check backup
commit;                         -- save

/******************************************************/
set autocommit = on;            -- restore default value
select @@autocommit;            -- check autocommit value

start transaction;              -- similar to commit
delete                          -- delete backup data
from backup;
select * from backup;           -- check backup

rollback;                       -- rollback deletion
select * from backup;           -- check backup
commit;                         -- save
