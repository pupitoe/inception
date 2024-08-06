FROM alpine:3.19.2

RUN apk add vim
RUN apk add redis

COPY [ "./tools", "tools" ]
RUN [ "chmod", "+x", "./tools/script.sh" ]
COPY ./conf/redis.conf /etc/redis.conf

ENTRYPOINT [ "./tools/script.sh", "redis-server" ]

EXPOSE 6379/tcp
