#!/bin/bash
mkdir -p /run/php
mkdir -p /var/www/html
cd /var/www/html
rm -rf *
sed -i 's/\/run\/php\/php7\.3-fpm\.sock/wordpress:9000/g' /etc/php/7.3/fpm/pool.d/www.conf
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root
mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
mv /wp-config.php /var/www/html/wp-config.php
sed -i -r "s/db_name/$DB_NAME/1"			wp-config.php
sed -i -r "s/db_user/$DB_USER/1"			wp-config.php
sed -i -r "s/db_password/$DB_PASSWORD/1"	wp-config.php
wp core install --url=$DOMAIN_NAME --title=Welcome --admin_user=$WP_USER --admin_password=$WP_PASSWORD --admin_email=$WP_EMAIL --skip-email --allow-root
wp user create jhon jhon@test.com --role=author --user_pass=jhon1234 --allow-root
/usr/sbin/php-fpm7.3 -F -R
