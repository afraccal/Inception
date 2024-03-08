#!/bin/sh

service mariadb start
mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
sleep 0.5
mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';"
sleep 0.5
mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
sleep 0.5
mysql -e "FLUSH PRIVILEGES;"
sleep 0.5
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown
exec mysqld_safe