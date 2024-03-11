cd /var/www/html/wordpress
chmod +x wp-cli.phar
./wp-cli.phar config create --path=/var/www/html/wordpress --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306 --allow-root
./wp-cli.phar core install --url=$DOMAIN_NAME --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL --skip-email --allow-root
./wp-cli.phar user create giorgio giorgio@gmail.com --role=author --porcelain --allow-root
chown -R www-data:www-data /var/www/html/wordpress/
/usr/sbin/php-fpm8.2 -F