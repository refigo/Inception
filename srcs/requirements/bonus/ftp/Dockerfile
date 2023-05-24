FROM debian:buster

ARG DOMAIN_NAME

RUN apt-get update && \
    apt-get install -y vsftpd openssl dumb-init && \
    rm -rf /var/lib/apt/lists/* && \
    openssl req -x509 -nodes -days 365 \
		-subj "/C=KR/ST=ICN\CN=${DOMAIN_NAME}" \
		-addext "subjectAltName=DNS:${DOMAIN_NAME}" \
		-newkey rsa:2048 \
		-keyout /etc/ssl/private/vsftpd-selfsigned.key \
		-out /etc/ssl/certs/vsftpd-selfsigned.crt;

COPY ./tools/docker-entrypoint.sh /usr/local/bin/

EXPOSE 21

ENTRYPOINT	[ "/usr/bin/dumb-init", "--" ]
CMD 		[ "docker-entrypoint.sh" ]
