FROM alpine:3.19.2

RUN apk add mysql mysql-client
RUN apk add mariadb mariadb-client
RUN apk add vim
RUN apk add openssl

COPY [ "./conf/maria.cnf", "/etc/my.cnf.d/maria.cnf" ]
RUN [ "mkdir", "database" ]
RUN [ "mkdir", "mysqlsocket" ]
RUN chown mysql /mysqlsocket
RUN chown mysql /database
USER mysql
#COPY [ "./tools", "tools" ]
#RUN [ "chmod", "+x", "./tools/script.sh" ]

#ENTRYPOINT [ "./tools/script.sh", "nginx",  "-g", "daemon off;" ]

CMD [ "tail", "-f" ]

EXPOSE 3306/tcp
