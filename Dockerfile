FROM ruby:2.6.3
RUN apt-get update && apt-get install -y \
        build-essential \
        libpq-dev \
        nodejs \
        postgresql \
        imagemagick \
        yarn
WORKDIR /CamFoo
COPY Gemfile Gemfile.lock /CamFoo/
RUN bundle install