FROM ruby:2.4-alpine

RUN \
  apk --update add build-base ruby-dev openssl-dev libc-dev linux-headers tzdata mariadb-dev sqlite nodejs git && \
  gem install rails:5

WORKDIR /usr/src

EXPOSE 3000
CMD rails
