FROM ruby:2.3

ADD Gemfile* /app/

WORKDIR /app

RUN bundle install

ADD . /app

CMD rackup -o 0.0.0.0