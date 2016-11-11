# rsyslog-relay-mysql
Run a rsyslog relay which writes to a mysql server

## Usage
```sh
$ docker run -i fmer/rsyslog-relay-mysql \
    -e MYSQL_HOST=mysql \
    -e MYSQL_PORT=3306 \
    -e MYSQL_DATABASE=logging \
    -e MYSQL_USER=root \
    -e MYSQL_PASSWORD=root
```
