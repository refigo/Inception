FROM debian:buster

ARG DOMAIN_NAME

RUN apt-get update \
	&& apt-get install -y nginx openssl \
	&& rm -rf /var/lib/apt/lists/*

RUN openssl req -x509 -nodes -days 365 \
	-subj "/C=KR/ST=ICN\CN=${DOMAIN_NAME}" \
	-addext "subjectAltName=DNS:${DOMAIN_NAME}" \
	-newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt;

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT [ "nginx" ]

EXPOSE 443

CMD [ "-g", "daemon off;" ]
