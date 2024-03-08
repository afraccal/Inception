FROM debian:bookworm

RUN apt-get update && apt-get install -y \
	nginx \
	openssl

COPY ./conf/default etc/nginx/sites-enabled/default
COPY ./conf/configure.sh /

RUN touch /tmp/switch.tmp

CMD [ "sh", "/configure.sh" ]