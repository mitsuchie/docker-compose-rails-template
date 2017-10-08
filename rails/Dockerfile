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
VOLUME  /app

RUN echo 'gem: --no-document' > /etc/gemrc

ENV HOME /app
ENV BUNDLE_APP_CONFIG /app/.bundle

RUN mkdir -p /app/tmp/sockets
CMD bundle exec puma
# CMD bundle exec rails s -p 3000 -b '0.0.0.0'
