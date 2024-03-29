#!/bin/bash

mkdir -p /app/code-server
wget https://github.com/coder/code-server/releases/download/v4.8.3/code-server-4.8.3-linux-amd64.tar.gz
tar xf code-server-4.8.3-linux-amd64.tar.gz -C /app/code-server --strip-components=1
ln -s /app/code-server/bin/code-server /usr/bin/code-server

exec code-server --auth=password --bind-addr=0.0.0.0:8080 --user-data-dir=/var/www/html --cert=/etc/ssl/certs/vscode-selfsigned.crt --cert-key=/etc/ssl/private/vscode-selfsigned.key
