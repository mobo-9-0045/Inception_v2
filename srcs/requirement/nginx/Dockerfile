FROM debian:buster

RUN apt update

RUN apt install -y nginx openssl
RUN mkdir /etc/nginx/ssl
RUN chmod 700 /etc/nginx/ssl
RUN mkdir -p /run/nginx

RUN openssl req -x509 -newkey rsa:2048 -keyout /etc/nginx/ssl/aomman.key -out /etc/nginx/ssl/aomman.pem -days 365 -nodes -subj "/CN=aomman.42.fr"
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf
CMD [ "nginx", "-g", "daemon off;" ]
