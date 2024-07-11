FROM alpine:3.19.2

RUN apk add mariadb mariadb-client
RUN apk add vim

COPY [ "./conf/maria.cnf", "/etc/my.cnf.d/maria.cnf" ]
COPY [ "./tools", "tools" ]
RUN [ "chmod", "+x", "./tools/script.sh" ]
RUN [ "mkdir", "database" ]
RUN [ "mkdir", "mysqlsocket" ]
RUN ["chown", "mysql", "/mysqlsocket"]
RUN ["chown", "mysql", "/database"]

USER mysql
ENTRYPOINT [ "./tools/script.sh", "mariadbd"]

EXPOSE 3306/tcp
