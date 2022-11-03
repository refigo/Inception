FROM debian:buster

RUN apt-get update && apt-get install -y \
	php-fpm \
	php-mysql \
	wget \
	curl \
	sendmail \
	mariadb-client \
	&& rm -rf /var/lib/apt/lists/*

# COPY ./conf/wp-config.php /tmp/wp-config.php
COPY ./tools/init.sh ./

# install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
	chmod +x wp-cli.phar &&\
	mv wp-cli.phar /usr/local/bin/wp

# set fpm conf to receive req fm nginx
RUN sed -i 's/\/run\/php\/php7.3-fpm.sock/0.0.0.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf &&\
	service php7.3-fpm start

EXPOSE 9000

ENTRYPOINT [ "/bin/bash" ]
CMD [ "init.sh" ]