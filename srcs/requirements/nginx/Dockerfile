FROM alpine:3.19.2

RUN apk upgrade --no-cache
RUN apk add nginx && apk add vim
RUN apk add openssl

cmd [ "mkdir", "/etc/nginx/conf.d" ]
COPY [ "./conf/nginx.conf", "/etc/nginx/conf.d/nginx.conf" ]
COPY [ "./conf/index.html", "/home/www/" ]
COPY [ "./tools", "tools" ]

ENTRYPOINT [ "./tools/script.sh", "nginx",  "-g", "daemon off;" ]
RUN [ "chmod", "+x", "./tools/script.sh" ]

EXPOSE 8080/tcp
