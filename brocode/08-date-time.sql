use brocode;

create table if not exists test(
    date     date,
    time     time,
    datetime datetime
);

select * from test;

insert into test
values  (CURRENT_DATE(), CURRENT_TIME(), NOW());
select * from test;

insert into test
values
    (CURRENT_DATE()+1, null, null ),
    (null, CURRENT_TIME()+1, null )
;
select * from test;
