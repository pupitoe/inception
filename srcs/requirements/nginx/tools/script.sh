#! /bin/sh

c_nginx=/etc/nginx/certif

namefile=fuck

c_path="$c_nginx/$namefile"

mkdir "$c_nginx"
openssl genrsa -out $c_path.key 2048
openssl req -new -key $c_path.key -out $c_path.csr -nodes -subj "/C=42/ST=France/L=Mulhouse/O=tomcompany/OU=tomCompanySection/CN=Inception"
openssl x509 -req -days 3650 -in $c_path.csr -signkey $c_path.key -out $c_path.crt

#execut arguments
exec "$@"

#exec "$(tail -f)"