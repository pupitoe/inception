#! /bin/sh

install_mariadb() {
	rm -rf /database/*

	mariadb-install-db --user=mysql
	mariadbd --user=mysql &
	PIDMDB="$!"
	until tail "/var/log/mysqld.log" | grep -q "Version:"; do
		sleep 0.2
	done
	mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_PASS_R'; FLUSH PRIVILEGES;"
	mariadb -u root -p"$MYSQL_PASS_R" -e "DROP USER ''@'localhost';"
	mariadb -u root -p"$MYSQL_PASS_R" -e "DROP USER ''@'$(hostname)';"
	mariadb -u root -p"$MYSQL_PASS_R" -e "DROP DATABASE test;"
	mariadb -u root -p"$MYSQL_PASS_R" -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASS';"
	mariadb -u root -p"$MYSQL_PASS_R" -e "FLUSH PRIVILEGES;"
	mariadb -u root -p"$MYSQL_PASS_R" -e "CREATE DATABASE wordpress;"
	mariadb -u root -p"$MYSQL_PASS_R" -e "GRANT ALL PRIVILEGES ON wordpress.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASS';"
	mariadb -u root -p"$MYSQL_PASS_R" -e "FLUSH PRIVILEGES;"
	kill -s QUIT "${PIDMDB}"
	wait "${PIDMDB}" # permet de free les la tache en arrier plan et d'avoir sont exit status
	rm -rf "/var/log/mysqld.log"

	touch /database/terminate_init_process
}
# check if db is installed
if [ ! -e /database/terminate_init_process ]; then
	install_mariadb
fi

MYSQL_USER=""
MYSQL_PASS=""
MYSQL_PASS_R=""

echo start mariadb
exec "$@"
