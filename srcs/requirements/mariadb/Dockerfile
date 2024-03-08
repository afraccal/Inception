FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y

RUN apt install mariadb-server -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./conf/createdb.sql /
COPY ./conf/configure.sh /configure.sh

CMD [ "sh", "/configure.sh" ]