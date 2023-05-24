# !/bin/sh

mkdir -p /var/www/html/adminer
curl -s -L https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php --output /var/www/html/adminer/index.php

exec php-fpm7.3 --nodaemonize
