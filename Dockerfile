FROM ruby:2.6.3
RUN apt-get update && apt-get install -y \
        build-essential \
        libpq-dev \
        nodejs \
        postgresql \
        yarn
RUN apt-get update && apt-get install -y imagemagick
WORKDIR /CanFoo
COPY Gemfile Gemfile.lock /CanFoo/
RUN bundle install