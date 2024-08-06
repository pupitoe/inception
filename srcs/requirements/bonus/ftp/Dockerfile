FROM alpine:3.19.2

RUN apk add vim
RUN apk add vsftpd

COPY [ "./tools", "tools" ]
#COPY ./conf/redis.conf /etc/redis.conf

CMD tail -f

EXPOSE 20/tcp
