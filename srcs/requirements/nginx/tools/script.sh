#! /bin/sh

c_nginx=/etc/nginx/certif

namefile=fuck

c_path="$c_nginx/$namefile"

mkdir "$c_nginx"
# make a key rsa
openssl genrsa -out $c_path.key 2048
# generate a certificate request
openssl req -new -key $c_path.key -out $c_path.csr -nodes -subj "/C=42/ST=France/L=Mulhouse/O=tomcompany/OU=tomCompanySection/CN=Inception"
# creating the certificate from the key and the request (-req specifies that it is a sertificate request)
openssl x509 -req -days 3650 -in $c_path.csr -signkey $c_path.key -out $c_path.crt

#execut arguments
exec "$@"
