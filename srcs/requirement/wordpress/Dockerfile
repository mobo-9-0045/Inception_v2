FROM debian:buster

WORKDIR /var/www/html
RUN apt update
RUN apt-get -y install curl php php-redis php7.3-fpm php-mysql mariadb-client php-curl php-gd php-json php-mbstring php-xml php-zip sendmail
COPY ./tools/wp.sh /
COPY ./conf/wp-config.php /
RUN chmod +x /wp.sh
CMD [ "/bin/bash", "/wp.sh"]
