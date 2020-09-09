FROM ruby:2.7.1

WORKDIR /delivery

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN gem install bundler && bundle install
