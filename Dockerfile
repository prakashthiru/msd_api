FROM ruby:2.3-slim
RUN apt-get update -qq && apt-get install -y build-essential nodejs

RUN mkdir /myapp
WORKDIR /myapp
COPY . /myapp

RUN bundle install
RUN bundle exec rake swagger:docs