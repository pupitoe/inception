FROM alpine:3.19.2

RUN apk add nginx && apk add vim
RUN apk add openssl

COPY [ "./conf/default.conf", "/etc/nginx/http.d/default.conf" ]
COPY [ "./conf/index.html", "/home/www/" ]
COPY [ "./tools", "tools" ]

ENTRYPOINT [ "./tools/script.sh", "nginx",  "-g", "daemon off;" ]
RUN [ "chmod", "+x", "./tools/script.sh" ]

EXPOSE 443/tcp
