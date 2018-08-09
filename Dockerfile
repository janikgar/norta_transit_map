FROM ruby:2.3-alpine
LABEL MAINTAINER janikgar@pm.me

ENV BUILD_PACKAGES bash curl-dev ruby-dev build-base postgresql-dev git
# ENV RUBY_PACKAGES 

RUN apk update && apk upgrade && \
    apk add $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/*

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app
COPY Gemfile.lock /app
RUN bundle install
# only if we're running Figaro
RUN figaro install

COPY . /app
EXPOSE 3000