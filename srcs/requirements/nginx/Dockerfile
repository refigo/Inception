FROM debian:buster

RUN apt-get update \
	&& apt-get install -y nginx \
	&& rm -rf /var/lib/apt/lists/*

COPY ./tools/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./tools/private.key /etc/ssl/private/
COPY ./tools/certificate.crt /etc/ssl/certs/

EXPOSE 443

ENTRYPOINT [ "nginx" ]
CMD [ "-g", "daemon off;" ]
