FROM debian:buster

RUN apt-get update && apt-get install -y \ mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./conf/createdb.sql /
COPY ./conf/configure.sh /configure.sh

CMD [ "sh", "/configure.sh" ]