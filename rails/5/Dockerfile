FROM ruby:2.4-alpine

RUN \
  apk --update add build-base linux-headers ruby-dev openssl-dev libc-dev mariadb-dev sqlite-dev imagemagick-dev tzdata nodejs git && \
  npm install -g yarn && \
  gem install rails:5

WORKDIR /usr/src

EXPOSE 3000
CMD rails
