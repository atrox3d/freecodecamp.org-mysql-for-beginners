create database if not exists brocode;
use brocode;

alter database brocode read only = 1;

drop database brocode;  -- fails

alter database brocode read only = 0;
