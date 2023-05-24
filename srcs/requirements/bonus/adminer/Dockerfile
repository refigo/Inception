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
        # php7.4-fpm \
        # php7.4-mysql \
        # php7.4-curl \
        # php7.4-json \
        dumb-init && \
    rm -rf /var/lib/apt/lists/*

ADD https://www.adminer.org/latest-mysql.php /var/www/adminer/adminer.php

# RUN set -ex && \
# 	chmod +x /docker-entrypoint.d/configuration.sh /docker-entrypoint.sh && \
#     chmod 755 /var/www/adminer/adminer.php && \
#     adduser -G www-data -D www-data && \
# 	chown www-data:www-data /var/www/adminer

COPY ./tools/docker-entrypoint.sh /usr/local/bin/

EXPOSE 8080

ENTRYPOINT	[ "/usr/bin/dumb-init", "--" ]
CMD			[ "/bin/bash", "docker-entrypoint.sh" ]
