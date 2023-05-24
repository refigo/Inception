#!/bin/bash

sed -i "s/bind 127.0.0.1/bind 0.0.0.0/g" /etc/redis/redis.conf
sed -i "s/protected-mode yes/protected-mode no/g" /etc/redis/redis.conf
sed -i "s/daemonize yes/daemonize no/g" /etc/redis/redis.conf

exec redis-server /etc/redis/redis.conf
