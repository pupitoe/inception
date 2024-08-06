#! /bin/sh

while ! nc -z mariadb 3306; do
  sleep 0.1
done
while ! nc -z redis 6379; do
  sleep 0.1
done

WP="php /wordpress_file/wp-cli.phar"

WEB_SITE=/home/www
FINISH_FILE="$WEB_SITE"/wordpress_finish_install

wordpress_startup() {
	cd /wordpress_file
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

	cd $WEB_SITE
	$WP core download
	$WP core config --dbhost=mariadb --dbname=$MYSQL_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASS
	# TO set up the database table
	$WP core install --url=https://$DOMAIN_NAME --title="fabio the big boss" --admin_name=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASS --admin_email="$WORDPRESS_ADMIN_USER@$DOMAIN_NAME" --skip-email
	#$WP config set WP_REDIS_HOST redis
	#$WP config set WP_REDIS_PORT 6379
	#$WP config set WP_REDIS_SCHEME "tpc"
	#$WP plugin install redis-cache --activate
	#$WP redis enable
	rm -f $WP
	cd /
	touch $FINISH_FILE
}

if [ ! -e $FINISH_FILE ]; then
	wordpress_startup
fi

unset MYSQL_PASS
unset MYSQL_USER
unset WORDPRESS_ADMIN_USER
unset WORDPRESS_ADMIN_PASS

echo start wordpress
exec "$@"
