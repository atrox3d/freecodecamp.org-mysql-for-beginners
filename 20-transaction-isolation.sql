set autocommit = 0;

show session variables;

show session variables like '%isolation%';

-- read upto date only after commit
set session transaction isolation level read committed;
show session variables like '%isolation%';

-- dirty read
set session transaction isolation level read uncommitted;
show session variables like '%isolation%';

-- continues to read
set session transaction isolation level repeatable read;
show session variables like '%isolation%';

-- lock
set session transaction isolation level serializable;
show session variables like '%isolation%';

-- start transaction;
