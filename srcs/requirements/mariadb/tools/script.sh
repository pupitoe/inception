#! /bin/sh

# check if db is installed
if [ ! -e /database/mysql_upgrade_info ];
then
	mariadb-install-db
fi

exec "$@"
