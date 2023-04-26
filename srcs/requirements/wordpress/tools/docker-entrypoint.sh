#!bin/bash

if [ ! -e /var/www/html/wp-config.php ]; then
	wget -c https://wordpress.org/latest.tar.gz
	tar -xzvf latest.tar.gz
	mv wordpress/* /var/www/html/
	chown -R www-data:www-data /var/www/html
	rmdir wordpress
	rm latest.tar.gz

	# Connect with db
	until wp config create --allow-root \
			--dbname=$WORDPRESS_DB_NAME \
			--dbuser=$WORDPRESS_DB_USER \
			--dbpass=$WORDPRESS_DB_PASSWORD \
			--dbhost=$WORDPRESS_DB_HOST \
			--path='/var/www/html' ; do
		sleep 2
		echo "Waiting for mariadb..."
		done

	# Config for admin
	wp core install --allow-root \
		--url='mgo.42.fr' \
		--title='The WordPress of mgo' \
		--admin_user=$WORDPRESS_ADMIN_USER \
		--admin_password=$WORDPRESS_ADMIN_PW \
		--admin_email=$WORDPRESS_ADMIN_EMAIL \
		--path='/var/www/html'

	# Create user
	wp user create --allow-root \
		$WORDPRESS_USER $WORDPRESS_USER_EMAIL \
		--user_pass=$WORDPRESS_USER_PW \
		--role=author \
		--path=/var/www/html
fi

php-fpm7.3 --nodaemonize
