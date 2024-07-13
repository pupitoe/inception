FROM alpine:3.19.2

RUN apk add nginx
RUN apk add openssl
RUN apk add vim

COPY [ "./conf/default.conf", "/etc/nginx/http.d/default.conf" ]
COPY [ "./conf/index.html", "/home/www/" ]
COPY [ "./tools", "tools" ]
RUN [ "chmod", "+x", "./tools/script.sh" ]
RUN mkdir -p /etc/nginx/certif
RUN chown nginx /etc/nginx/certif
RUN chown nginx /home/www

USER nginx

ENTRYPOINT [ "./tools/script.sh", "nginx",  "-g", "daemon off;" ]

EXPOSE 443/tcp
