#!/bin/sh

MYSQL_HOST=${MYSQL_HOST:-'mysql'}
MYSQL_PORT=${MYSQL_PORT:-'3306'}
MYSQL_DATABASE=${MYSQL_DATABASE:-'logging'}
MYSQL_USER=${MYSQL_USER:-'root'}
MYSQL_PASSWORD=${MYSQL_PASSWORD:-''}

sed -i \
  -e "s/{{MYSQL_HOST}}/${MYSQL_HOST}/g" \
  -e "s/{{MYSQL_PORT}}/${MYSQL_PORT}/g" \
  -e "s/{{MYSQL_DATABASE}}/${MYSQL_DATABASE}/g" \
  -e "s/{{MYSQL_USER}}/${MYSQL_USER}/g" \
  -e "s/{{MYSQL_PASSWORD}}/${MYSQL_PASSWORD}/g" \
  /etc/rsyslog.conf

if [ -z "$1" ]; then
  exec rsyslogd -n
else
  exec "$@"
fi
