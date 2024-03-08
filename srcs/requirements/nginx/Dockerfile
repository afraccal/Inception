FROM debian:bookworm

RUN apt-get update && \
    apt upgrade && \
    apt-get install nginx openssl -y

COPY ./conf/default.conf etc/nginx/conf.d/default.conf

RUN mkdir -p /etc/ssl && \
	mkdir -p /run/nginx
	
RUN mkdir -p /var/www/html

RUN openssl req -x509 -nodes -out "/etc/ssl/inception.crt" -keyout "/etc/ssl/inception.key" -subj "/C=IT/ST=Lazio/L=Rome/O=42/OU=42/CN=afraccal.42.fr/UID=ades" && \
	chmod -R 775 /var/www/html && \
    chown -R www-data:www-data /var/www/html

ENTRYPOINT ["nginx", "-g", "daemon off;"]