#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0) && pwd)
ROOT_DIR=$(cd $SCRIPT_DIR/.. && pwd)

echo '>> COPY Gemfile'
mkdir -p $ROOT_DIR/work
cp $ROOT_DIR/rails/Gemfile      $ROOT_DIR/work/Gemfile
cp $ROOT_DIR/rails/Gemfile.lock $ROOT_DIR/work/Gemfile.lock

echo '>> COPY .bundle/config'
mkdir -p $ROOT_DIR/work/.bundle
cp $ROOT_DIR/rails/.bundle/config $ROOT_DIR/work/.bundle/config

COMMAND="docker-compose run --rm app bundle install -j4 --path vendor/bundle"
echo $COMMAND && $COMMAND

COMMAND="docker-compose run --rm app bundle exec rails new . --force --database=mysql"
echo $COMMAND && $COMMAND
#
COMMAND="docker-compose run --rm app bundle install -j4"
echo $COMMAND && $COMMAND
 
echo ">> COPY rails/config/"
cp $ROOT_DIR/rails/config/* $ROOT_DIR/work/config/

echo ">> MKDIR work/tmp/sockets"
mkdir -p $ROOT_DIR/work/tmp/sockets
 
COMMAND="docker-compose run --rm app bundle exec rake db:create db:migrate"
echo $COMMAND && $COMMAND
