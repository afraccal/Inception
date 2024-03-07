#!/bin/bash

if [ -f /tmp/switch.tmp ]; then
	# Set Env
	sed -i -e "s/\${DB_NAME}/${DB_NAME}/g" /var/www/wordpress/wp-config.php;
	sed -i -e "s/\${DB_USER}/${DB_USER}/g" /var/www/wordpress/wp-config.php;
	sed -i -e "s/\${DB_PASSWORD}/${DB_PASSWORD}/g" /var/www/wordpress/wp-config.php;
	sed -i -e "s/\${DB_HOST}/${DB_HOST}/g" /var/www/wordpress/wp-config.php;

	# Create the php folder
	mkdir -p ./run/php/;

	# Remove the switch
	rm -f /tmp/switch.tmp;

fi

# Entrypoint
/usr/sbin/php-fpm7.3 -F;