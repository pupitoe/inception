#! /bin/sh

c_nginx=/etc/nginx/certif

namefile=fuck

c_path="$c_nginx/$namefile"

mkdir "$c_nginx"
#if [ $(ls $c_path.key) -eq 1 ]; then
	openssl genrsa -out $c_path.key 2048
	openssl req -new -key $c_path.key -out $c_path.csr -nodes -subj "/C=42/ST=France/L=Mulhouse/O=tomcompany/OU=tomCompanySection/CN=Inception"
	openssl x509 -req -days 3650 -in $c_path.csr -signkey $c_path.key -out $c_path.crt
#fi

#execut arguments
exec "$@"
