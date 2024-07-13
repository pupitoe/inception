#! /bin/sh

c_nginx=/etc/nginx/certif

namefile=fuck

c_path="$c_nginx/$namefile"

# the conditions are used to check if the files are not created and to make them as needed
# -e return true if file exist

# make a key rsa
if [ ! -e $c_path.key ];
then
	openssl genrsa -out $c_path.key 2048
fi

# generate a certificate request (-nodes -subj is used to not use interactive mode and make all inline)
if [ ! -e $c_path.csr ];
then
	openssl req -new -key $c_path.key -out $c_path.csr -nodes -subj "/C=42/ST=France/L=Mulhouse/O=tomcompany/OU=tomCompanySection/CN=Inception"
fi

# creating the certificate from the key and the request (-req specifies that it is a sertificate request)
if [ ! -e $c_path.crt ];
then
	openssl x509 -req -days 3650 -in $c_path.csr -signkey $c_path.key -out $c_path.crt
fi

while ! nc -z wordpress 9000; do
  sleep 0.1
done

#execut arguments
exec "$@"
