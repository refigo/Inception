FROM mariadb:latest

# Set the root password for MariaDB
ENV MYSQL_ROOT_PASSWORD my-secret-pw

# Create a new database and user
ENV MYSQL_DATABASE mydatabase
ENV MYSQL_USER myuser
ENV MYSQL_PASSWORD my-password

# Copy any initialization scripts to the container
COPY init.sql /docker-entrypoint-initdb.d/