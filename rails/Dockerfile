FROM ruby:2.4-alpine
ENV LANG C.UTF-8

RUN apk update && \
    apk upgrade && \
    apk add --update \
      alpine-sdk \
      mysql-dev \
      nodejs \
      tzdata

RUN mkdir -p /app
WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

RUN gem install bundler
RUN bundle install -j4

ADD . /app
RUN rails new . --force --database=mysql

ADD ./config/* /app/config/

# Database 
# RUN cp database.yml config/database.yml

# WebServer
RUN mkdir -p /app/tmp/sockets
VOLUME /app/public
VOLUME /app/tmp

CMD bundle exec puma
# CMD bundle exec rails s -p 3000 -b '0.0.0.0'
