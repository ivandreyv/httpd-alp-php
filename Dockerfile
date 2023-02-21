FROM alpine:3.17

RUN	apk --no-cache update && apk --no-cache upgrade \
	&& apk add apache2 apache2-ctl php81-apache2 php81 \
	&& rm /var/www/localhost/htdocs/index.html \
	&& ln -sf /dev/stdout /var/log/apache2/access.log  \
	&& ln -sf /dev/stderr /var/log/apache2/error.log  

COPY ./index.php /var/www/localhost/htdocs/

CMD ["httpd","-D","FOREGROUND"]

