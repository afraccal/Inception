FROM debian:bookworm

RUN apt-get update && apt-get install -y \
	nginx \
	openssl

COPY ./conf/default.conf etc/nginx/sites-enabled/default.conf

RUN mkdir -p /etc/ssl && \
	mkdir -p /run/nginx
	
RUN mkdir -p /var/www/html

RUN openssl req -x509 -nodes -out "/etc/ssl/inception.crt" -keyout "/etc/ssl/inception.key" -subj "/C=${NGINX_C}/ST=${NGINX_ST}/L=${NGINX_L}/O=${NGINX_O}/OU=${NGINX_OU}/CN=${NGINX_CN}/emailAddress=${NGINX_EMAIL_ADDRESS}"; && \
	chmod -R 775 /var/www/html && \
    chown -R www-data:www-data /var/www/html

ENTRYPOINT ["nginx", "-g", "daemon off;"]