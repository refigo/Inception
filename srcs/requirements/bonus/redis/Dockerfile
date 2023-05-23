FROM debian:buster

RUN apt-get update && \
    apt-get install -y redis dumb-init && \
    # chmod +x /usr/bin/dumb-init 
    rm -rf /var/lib/apt/lists/*

COPY ./tools/docker-entrypoint.sh /usr/local/bin/

EXPOSE 6379

ENTRYPOINT	[ "/usr/bin/dumb-init", "--" ]
CMD 		[ "docker-entrypoint.sh" ]
