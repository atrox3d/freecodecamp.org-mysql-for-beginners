set autocommit=0;
set transaction isolation level read committed;

select * from performance_schema.data_locks;
