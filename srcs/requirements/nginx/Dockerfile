FROM alpine:3.19.2

RUN apk add nginx && apk add vim

RUN mkdir /etc/nginx/conf.d

COPY [ "./conf/server.conf", "/etc/nginx/conf.d/server.conf" ]

CMD [ "tail", "-f" ]

EXPOSE 80/tcp
