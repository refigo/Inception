FROM debian:buster

RUN apt-get update && apt-get upgrade && apt-get install -y \
	php-fpm \
	php-mysql \
	wget \
	curl \
	mariadb-client \
	# sendmail \
	&& rm -rf /var/lib/apt/lists/*

COPY ./tools/docker-entrypoint.sh ./

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

RUN sed -i 's/\/run\/php\/php7.3-fpm.sock/0.0.0.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf &&\
	service php7.3-fpm start

EXPOSE 9000

WORKDIR /var/www/html

ENTRYPOINT [ "/bin/bash" ]
CMD [ "/docker-entrypoint.sh" ]
