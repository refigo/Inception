FROM debian:buster

RUN apt-get update && apt-get install -y\
	nginx\
	openssl\
	&& rm -rf /var/lib/apt/lists/* /etc/nginx/sites-enabled/default

# copy a self-signed certificate
COPY ./tools/inception.crt etc/ssl/certs/
COPY ./tools/inception.key etc/ssl/private/

# copy nginx configuration
COPY ./conf/setting /etc/nginx/sites-enabled/setting

EXPOSE 443

# run nginx forground
ENTRYPOINT [ "nginx" ]
CMD [ "-g", "daemon off;" ]