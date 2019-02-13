FROM ruby:2.5-alpine

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

ENV GIT_HASH 82a2fa3ca1038b1c9defc77b3132a511daa7592f

ENV RAILS_ENV development
ENV RACK_ENV development
ENV NODE_ENV production

RUN git clone https://github.com/snibox/snibox.git /app && cd /app && git reset --hard $GIT_HASH

COPY . /app

RUN gem install bundler && bundle install

VOLUME /app/db/database

RUN bundle exec rake assets:precompile

EXPOSE 3000

CMD cd /app && rake 'db:migrate' && bundle exec rails server -b 0.0.0.0
