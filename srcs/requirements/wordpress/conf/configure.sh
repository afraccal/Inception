#!/bin/bash

cd /var/www/html/wordpress
chmod +x wp-cli.phar
./wp-cli.phar config create --path=/var/www/html/wordpress --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST:3306 --allow-root
./wp-cli.phar core install --url=afraccal.42.fr --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL --skip-email --allow-root
./wp-cli.phar user create giorgio giorgio@gmail.com --role=author --porcelain --allow-root
chown -R www-data:www-data /var/www/html/wordpress/
/usr/sbin/php-fpm8.2 -F;