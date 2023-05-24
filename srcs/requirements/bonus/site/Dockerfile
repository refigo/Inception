FROM debian:buster as builder

RUN		apt-get update && \
		apt-get install curl -y && \
        curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
		apt-get install nodejs -y

WORKDIR	/app

COPY ./tools/app/package.json ./
COPY ./tools/app/package-lock.json /app/package-lock.json

RUN	npm install
# RUN	npm install -g react-scripts

COPY ./tools/app/public ./public
COPY ./tools/app/src ./src
RUN	npm run build

FROM debian:buster as server

RUN	apt-get update && \
    apt-get install nginx dumb-init -y && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /app/build /var/www/html

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./tools/docker-entrypoint.sh /usr/local/bin/

EXPOSE 3000

ENTRYPOINT  [ "/usr/bin/dumb-init", "--" ]
CMD         [ "docker-entrypoint.sh" ]
