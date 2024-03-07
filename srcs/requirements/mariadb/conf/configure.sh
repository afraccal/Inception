#!/bin/bash

if [ -f /createdb.sql ]; then
	# Set env
	sed -i -e "s/\${DB_USER}/${DB_USER}/g" /createdb.sql;
	sed -i -e "s/\${DB_PASSWORD}/${DB_PASSWORD}/g" /createdb.sql;
	sed -i -e "s/\${DB_NAME}/${DB_NAME}/g" /createdb.sql;
	sed -i -e "s/\${MYSQL_ROOT_PWD}/${MYSQL_ROOT_PWD}/g" /createdb.sql;

	# Set no writing permissions
	chmod 0444 /etc/mysql/mariadb.conf.d/50-server.cnf;

	# Create the Database
	service mysql start 2> /dev/null 1> /dev/nul \
	&& mysql < /createdb.sql 2> /dev/null 1> /dev/nul \
	&& service mysql stop 2> /dev/null 1> /dev/null;

	# Remove the database creation file
	rm -f /createdb.sql;
fi

# Entrypoint
/usr/bin/mysqld_safe;