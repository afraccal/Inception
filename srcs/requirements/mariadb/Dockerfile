FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y

RUN apt install mariadb-server -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/configure.sh /

CMD [ "sh", "/configure.sh" ]