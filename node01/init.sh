#!/bin/bash
/usr/bin/supervisord -c /etc/supervisord.conf

for i in `seq 1 5`;
do
	/usr/bin/nc -z localhost 3306 && break
	sleep 1
done

echo "GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY 'password';" | /usr/bin/mysql -u root
echo "CREATE DATABASE IF NOT EXISTS galera_test;" | /usr/bin/mysql -u root -ppassword
echo "GRANT ALL ON galera_test.* TO 'galera'@'localhost' IDENTIFIED BY 'password';" | /usr/bin/mysql -u root -ppassword
echo "GRANT ALL ON galera_test.* TO 'galera'@'%' IDENTIFIED BY 'password';" | /usr/bin/mysql -u root -ppassword

