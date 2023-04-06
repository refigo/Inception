# FROM debian:buster

# RUN apt-get update \
# 	&& apt-get install -y nginx \
# 	&& rm -rf /var/lib/apt/lists/*

# COPY . .

FROM nginx:latest
COPY ./tools/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 443

ENTRYPOINT [ "nginx" ]
CMD [ "-g", "daemon off;" ]
