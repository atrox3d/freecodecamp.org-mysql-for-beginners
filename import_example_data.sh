#!/usr/bin/env bash

alias mysql=/opt/homebrew/opt/mysql-client/bin/mysql

mysql -h 127.0.0.1 -u root -p < ../employee-sample-database/mysql/dataset_full/employee.sql
mysql -h 127.0.0.1 -u root -p < ../employee-sample-database/mysql/dataset_full/test_employee_md5.sql
