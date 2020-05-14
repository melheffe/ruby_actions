#!/bin/sh

cd $GITHUB_WORKSPACE/

ruby --version
gem --version
echo "Hello World!"

bundle install

bundle exec rake db:create db:migrate
