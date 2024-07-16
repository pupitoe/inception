#! /bin/sh

install_mariadb() {
	rm -rf /database/*

	mariadb-install-db --user=mysql
	mariadbd --user=mysql &
	PIDMDB="$!"
	until tail "/var/log/mysqld.log" | grep -q "Version:"; do
		sleep 0.2
	done
	mariadb-secure-installation -S /mysqlsocket/mysql.sock << EOF

n
Y
PASS
PASS
Y
Y
Y
Y
EOF
	kill -s QUIT "${PIDMDB}"
	wait "${PIDMDB}" # permet de free les la tache en arrier plan et d'avoir sont exit status
	rm -rf "/var/log/mysqld.log"

	touch /database/terminate_init_process
}
# check if db is installed
if [ ! -e /database/terminate_init_process ]; then
	install_mariadb
fi

exec "$@"
