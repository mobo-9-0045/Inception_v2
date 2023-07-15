#!/bin/bash
service mysql start
echo "CREATE DATABASE IF NOT EXISTS\`${SQL_DATABASE}\`;" > DATABASE.sql
#echo "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';" >> DATABASE.sql
echo "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD' ;" >> DATABASE.sql
echo "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';" >> DATABASE.sql
echo "FLUSH PRIVILEGES;" >> DATABASE.sql

mysql < DATABASE.sql

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
