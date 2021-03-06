FROM ruby:2.3-alpine
LABEL maintainer=janikgar@pm.me

ENV BUILD_PACKAGES bash build-base curl-dev git postgresql-dev ruby-dev
# ENV RUBY_PACKAGES 

RUN apk update && apk upgrade && \
    apk add $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/*

RUN gem install bundler

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app
COPY Gemfile.lock /app
RUN bundle install && \
    figaro install
# only if we're running Figaro

COPY . /app
EXPOSE 3000