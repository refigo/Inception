FROM debian:buster

ARG DOMAIN_NAME

RUN	apt-get update && \
	apt-get install -y \
        openssl \
		wget \
        dumb-init && \
    rm -rf /var/lib/apt/lists/* && \
	openssl req -x509 -nodes -days 365 \
		-subj "/C=KR/ST=ICN\CN=${DOMAIN_NAME}" \
		-addext "subjectAltName=DNS:${DOMAIN_NAME}" \
		-newkey rsa:2048 \
		-keyout /etc/ssl/private/vscode-selfsigned.key \
		-out /etc/ssl/certs/vscode-selfsigned.crt;

COPY ./tools/docker-entrypoint.sh /usr/local/bin/

EXPOSE 8443

ENTRYPOINT	[ "/usr/bin/dumb-init", "--" ]
CMD			[ "/bin/bash", "docker-entrypoint.sh" ]
