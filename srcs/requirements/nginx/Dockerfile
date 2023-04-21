FROM debian:buster

RUN apt-get update \
	&& apt-get install -y nginx openssl \
	&& rm -rf /var/lib/apt/lists/*

RUN openssl req -x509 -nodes -days 365 \
	-subj "/C=KR/ST=ICN\CN=mgo.42.fr" \
	-addext "subjectAltName=DNS:mgo.42.fr" \
	-newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt;

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT [ "nginx" ]

EXPOSE 80
EXPOSE 443

CMD [ "-g", "daemon off;" ]
