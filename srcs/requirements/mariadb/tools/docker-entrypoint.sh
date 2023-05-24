#!/bin/bash

if [ ! -d /var/lib/mysql/$MARIADB_DATABASE ]; then
	chown -R mysql:mysql /var/lib/mysql

	service mysql start

	mysql -e "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE CHARACTER SET utf8;\
		CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';\
		GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%';\
		ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD'; FLUSH PRIVILEGES;"

	mysqladmin -uroot -p$MARIADB_ROOT_PASSWORD shutdown
fi

exec mysqld_safe
