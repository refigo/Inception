FROM debian:buster

ARG DOMAIN_NAME

RUN apt-get update \
	&& apt-get install nginx openssl dumb-init -y \
	&& rm -rf /var/lib/apt/lists/* \
	&& openssl req -x509 -nodes -days 365 \
		-subj "/C=KR/ST=ICN\CN=${DOMAIN_NAME}" \
		-addext "subjectAltName=DNS:${DOMAIN_NAME}" \
		-newkey rsa:2048 \
		-keyout /etc/ssl/private/nginx-selfsigned.key \
		-out /etc/ssl/certs/nginx-selfsigned.crt;

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./tools/docker-entrypoint.sh /usr/local/bin/

EXPOSE 443

ENTRYPOINT  [ "/usr/bin/dumb-init", "--" ]
CMD         [ "docker-entrypoint.sh" ]
