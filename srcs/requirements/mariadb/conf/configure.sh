#!/bin/bash

service mariadb start
mysql -e "CREATE DATABASE IF NOT EXIST $DB_HOST;"
sleep 0.5
mysql -e "CREATE USER IF NOT EXIST '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';"
sleep 0.5
mysql -e "GRANT ALL PRIVILEGES ON $DB_HOST.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
sleep 0.5
mysql -e "FLUSH PRIVILEGES;"
sleep 0.5
mysqladmin -u root -p$MYSQL_ROOT_PWD shutdown
exec mysqld_safe
