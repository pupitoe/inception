FROM alpine:3.19.2

RUN apk add mariadb mariadb-client
RUN apk add vim

COPY [ "./conf/maria.cnf", "/etc/my.cnf.d/maria.cnf" ]
COPY [ "./tools", "tools" ]
RUN [ "chmod", "+x", "./tools/script.sh" ]
RUN [ "mkdir", "database" ]
RUN [ "mkdir", "mysqlsocket" ]
RUN ["chown", "mysql:mysql", "/mysqlsocket"]
RUN ["chown", "mysql:mysql", "/database"]
RUN ["chown", "mysql:mysql", "/etc"]
RUN mkdir /var/lib/mysql
RUN ["chown", "mysql:mysql", "/var/lib/mysql"]
RUN ["chown", "mysql:mysql", "/var/log"]

RUN rm /etc/my.cnf.d/mariadb-server.cnf

ENTRYPOINT [ "./tools/script.sh", "mariadbd", "--user=mysql"]

EXPOSE 3306/tcp
