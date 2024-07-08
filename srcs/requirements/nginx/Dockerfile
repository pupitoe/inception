FROM alpine:3.19.2

RUN apk add nginx && apk add vim
RUN apk add openssl

COPY [ "./conf/nginx.conf", "/etc/nginx/nginx.conf" ]
COPY [ "./conf/index.html", "/home/www/" ]

CMD [ "nginx", "-g", "daemon off;" ]

EXPOSE 8080/tcp
