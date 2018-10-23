FROM ruby:2.5.1-alpine3.7

RUN apk add --no-cache \
    git \
    build-base \
    tzdata \
    nodejs \
    yarn \
    sqlite-dev \
    bash \
    postgresql-dev

WORKDIR /app

ENV RAILS_ENV development
ENV RACK_ENV development
ENV NODE_ENV production

RUN git clone https://github.com/snibox/snibox.git /app
COPY Gemfile ./
RUN gem install bundler && bundle install
COPY database.yml ./config/database.yml

VOLUME /app/db/database

RUN ./bin/rake db:migrate

RUN ./bin/rake assets:precompile

EXPOSE 3000

ENTRYPOINT ./bin/rails server