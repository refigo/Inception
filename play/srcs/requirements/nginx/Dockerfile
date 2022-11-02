FROM debian:buster

RUN apt-get update \
	&& apt-get install -y nginx

COPY default /etc/nginx/sites-available/default

EXPOSE 80/tcp

#ENTRYPOINT [ "nginx" ]
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
