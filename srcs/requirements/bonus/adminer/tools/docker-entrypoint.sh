# !/bin/sh

echo "listen = 8000" >> /etc/php/7.4/fpm/pool.d/www.conf
mkdir -p /var/www/wordpress/adminer
curl -s -L https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php --output /var/www/wordpress/adminer/index.php

# after run dumb init
php-fpm7.4 --nodaemonize 

# sed -i "/listen = /c\listen = 0.0.0.0:8080" /etc/php8/php-fpm.d/www.conf
# sed -i "/user = nobody/c\user = www-data" /etc/php8/php-fpm.d/www.conf
# sed -i "/group = nobody/c\group = www-data" /etc/php8/php-fpm.d/www.conf
