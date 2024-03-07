#!/bin/bash

if [ -f /tmp/switch.tmp ]; then

	# Create the ssl key
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/ssl/private/nginx.key \
		-out /etc/ssl/certs/nginx.crt \
		-subj "/C=${NGINX_C}/ST=${NGINX_ST}/L=${NGINX_L}/O=${NGINX_O}/OU=${NGINX_OU}/CN=${NGINX_CN}/emailAddress=${NGINX_EMAIL_ADDRESS}";
	
	# Remove the switch
	rm -f /tmp/switch.tmp;

fi

nginx -g "daemon off;";