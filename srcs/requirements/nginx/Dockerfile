FROM debian:buster

RUN apt-get update \
	&& apt-get install -y nginx \
	&& rm -rf /var/lib/apt/lists/*

COPY . .

EXPOSE 443

ENTRYPOINT [ "nginx" ]
CMD [ "-g", "daemon off;" ]
