FROM debian:buster

RUN	apt-get update && \
	apt-get install -y \
        php \
        php-fpm \
        php-mysql \
        php-curl \
        php-json \
        curl \
        mariadb-client \
        dumb-init && \
    rm -rf /var/lib/apt/lists/* && \
    sed -i 's/\/run\/php\/php7.3-fpm.sock/0.0.0.0:8080/g' /etc/php/7.3/fpm/pool.d/www.conf && \
    service php7.3-fpm start

COPY ./tools/docker-entrypoint.sh /usr/local/bin/

EXPOSE 8080

ENTRYPOINT	[ "/usr/bin/dumb-init", "--" ]
CMD			[ "/bin/bash", "docker-entrypoint.sh" ]
