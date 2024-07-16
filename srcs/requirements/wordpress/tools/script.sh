#! /bin/sh

while ! nc -z mariadb 3306; do
  sleep 0.1
done

wordpress_startup() {
	wget https://wordpress.org/latest.tar.gz
	tar -xzvf latest.tar.gz
	rm latest.tar.gz
	mv ./wordpress/* /home/www
	rmdir ./wordpress
	touch /home/www/wordpress_finish_install
}

if [ ! -e /home/www/wordpress_finish_install ]; then
	cd ./wordpress_file
	wordpress_startup
	cd ..
fi

echo start wordpress
exec "$@"