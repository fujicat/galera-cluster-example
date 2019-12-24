#!/bin/bash
/usr/bin/supervisord -c /etc/supervisord.conf

until mysqladmin ping -h localhost --silent; do
	echo 'waiting for mysqld to be connectable...'
	sleep 3
done

echo "GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY 'password';" | /usr/bin/mysql -u root
echo "CREATE DATABASE IF NOT EXISTS galera_test;" | /usr/bin/mysql -u root -ppassword
echo "GRANT ALL ON galera_test.* TO 'galera'@'localhost' IDENTIFIED BY 'password';" | /usr/bin/mysql -u root -ppassword
echo "GRANT ALL ON galera_test.* TO 'galera'@'%' IDENTIFIED BY 'password';" | /usr/bin/mysql -u root -ppassword

