# Rails
Rails docker image based on [alpine](https://hub.docker.com/_/alpine/) for development.

Includes nodejs, sqlite, mariadb-dev and additional build dependencies for running Rails applications.

# Usage
Create a new `docker-compose.yml` with the following content.
```yml
version: '3'

volumes:
  bundle:
  mysql:

services:
  web:
    image: fmer/rails:5
    command: bin/rails s -b 0.0.0.0
    environment:
      DATABASE_URL: mysql2://root:example@mysql/example_application
    ports:
      - 3000:3000
    volumes:
      - .:/usr/src
      - bundle:/usr/local/bundle
    tmpfs:
      - /usr/src/tmp
  mysql:
    image: mysql
    environment:
      MYSQL_ROOT_PASSWORD: example
    volumes:
      - mysql:/var/lib/mysql
```

Create a new Rails application inside the folder of the `docker-compose.yml`.
```sh
$ docker-compose run --rm web bin/rails new .
```

To pass the database configuration inside the container through an environment-variable the `config/database.yml` has to be altered. This approach offers the ability to change the database configuration without altering the configuration of the application directly.
```yml
...

development:
  url: <%= ENV['DATABASE_URL'] %>

production:
  url: <%= ENV['DATABASE_URL'] %>

...
```

Now the application can be started and the database created.
```sh
$ docker-compose up -d
$ docker-compose run --rm web rails db:create
```

Visit youre newely created rails app at [http://localhost:3000](http://localhost:3000).
