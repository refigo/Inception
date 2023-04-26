FROM debian:buster

RUN apt-get update && \
	apt-get install -y \
		php-fpm \
		php-mysql \
		mariadb-client \
		wget \
		curl \
		dumb-init && \
	rm -rf /var/lib/apt/lists/* && \
	curl -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp && \
	chmod +x /usr/bin/wp && \
	sed -i 's/\/run\/php\/php7.3-fpm.sock/0.0.0.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf && \
	service php7.3-fpm start

COPY ./tools/docker-entrypoint.sh /usr/local/bin/

EXPOSE 9000

WORKDIR /var/www/html

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
CMD [ "/bin/bash", "docker-entrypoint.sh" ]
