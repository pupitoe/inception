FROM alpine:3.19.2

RUN apk add nginx && apk add vim

RUN mkdir /etc/nginx/conf.d

COPY [ "./conf/server.conf", "/etc/nginx/conf.d/server.conf" ]
COPY [ "./conf/nginx.conf", "/etc/nginx/nginx.conf" ]
COPY [ "./conf/index.html", "/home/www/" ]

CMD [ "tail", "-f" ]

#CMD [ "nginx", "" ]

EXPOSE 8080/tcp
