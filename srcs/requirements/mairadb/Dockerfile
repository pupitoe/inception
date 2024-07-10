FROM alpine:3.19.2

RUN apk add mariadb
RUN apk add vim
RUN apk add openssl

#COPY [ "./conf/default.conf", "/etc/nginx/http.d/default.conf" ]
#COPY [ "./tools", "tools" ]
#RUN [ "chmod", "+x", "./tools/script.sh" ]

#ENTRYPOINT [ "./tools/script.sh", "nginx",  "-g", "daemon off;" ]

CMD [ "tail", "-f" ]

EXPOSE 3306/tcp
