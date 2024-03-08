FROM debian:bookworm

RUN apt update && apt upgrade
RUN	apt install wget php php-fpm php-mysqli php-curl php-dom php-exif php-fileinfo php-xml php-zip php-phar php-tokenizer -y
RUN mkdir -p var/www/html
RUN	wget -P /var/www/html https://wordpress.org/latest.tar.gz
RUN	cd /var/www/html && tar -xzvf latest.tar.gz

COPY conf/configure.sh /usr/local/bin/
COPY conf/php-fpm.conf /etc/php/8.2/php-fpm.conf
COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

RUN	wget -P /var/www/html/wordpress https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

ENTRYPOINT [ "/bin/sh", "/usr/local/bin/configure.sh" ]