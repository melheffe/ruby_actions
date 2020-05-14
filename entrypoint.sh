#!/bin/sh

cd $GITHUB_WORKSPACE/

ruby --version
gem --version
echo "Hello World!"

bundle install

bundle exec rake db:test:prepare

bundle exec rspec --pattern spec/features/*_spec.rb
