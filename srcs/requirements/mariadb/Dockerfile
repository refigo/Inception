FROM debian:buster

RUN apt-get update && \
	apt-get install -y mariadb-server dumb-init && \
	rm -rf /var/lib/apt/lists/*

RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/docker-entrypoint.sh /usr/local/bin/

EXPOSE 3306

ENTRYPOINT	[ "/usr/bin/dumb-init", "--" ]
CMD 		[ "docker-entrypoint.sh" ]
