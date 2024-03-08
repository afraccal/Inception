FROM debian:bookworm

RUN apt-get update && apt-get install -y \
	php7.3 \
	php-mysqli \
	php-fpm \
	mariadb-client

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

ADD https://it.wordpress.org/wordpress-5.7.2-it_IT.tar.gz /var/www/
RUN cd /var/www && tar -xzvf wordpress-5.7.2-it_IT.tar.gz
RUN rm -f /var/www/wordpress-5.7.2-it_IT.tar.gz
RUN rm -f /var/www/wordpress/wp-config-sample.php

COPY ./conf/wp-config.php ./var/www/wordpress/
COPY ./conf/configure.sh /configure.sh

RUN touch /tmp/switch.tmp

CMD [ "sh", "/configure.sh" ]