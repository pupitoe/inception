#! /bin/sh

while ! nc -z mariadb 3306; do
  sleep 0.1
done

echo start wordpress
exec "$@"