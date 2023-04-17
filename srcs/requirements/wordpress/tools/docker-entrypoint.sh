#!bin/bash

if [ ! -e /var/www/html/wp-config.php ]; then
	wget -c https://wordpress.org/latest.tar.gz
	tar -xvf latest.tar.gz
	mv ./wordpress/* /var/www/html/
	chown -R www-data:www-data /var/www/html
	rm -rf ./latest.tar.gz ./wordpress

	# Connect with db
	until wp config create --allow-root \
			--dbname=$WORDPRESS_DB_NAME \
			--dbuser=$WORDPRESS_DB_USER \
			--dbpass=$WORDPRESS_DB_PASSWORD \
			--dbhost=$WORDPRESS_DB_HOST \
			--path='/var/www/html' ; do
		sleep 2
		done

	# Config for admin
	wp core install --allow-root \
		--url='localhost' \
		--title='test_tile' \
		--admin_user='test_admin_name' \
		--admin_password='admin_pw' \
		--admin_email="42.4.mgo@gmail.com" \
		--path='/var/www/html'

	# Create user
	wp user create --allow-root \
		mgo mgo@student.42seoul.kr \
		--user_pass='mgo_pw' \
		--role=author \
		--path=/var/www/html
fi

# service sendmail start
php-fpm7.3 --nodaemonize
