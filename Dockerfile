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

ARG GIT_HASH
ENV GIT_HASH ${GIT_HASH:2dad2bb572aa458760decde5320c382b3080a22e}

ENV RAILS_ENV development
ENV RACK_ENV development
ENV NODE_ENV production

RUN git clone https://github.com/snibox/snibox.git /app && cd /app && git reset --hard $GIT_HASH

COPY Gemfile ./
RUN gem install bundler && bundle install
COPY database.yml ./config/
COPY application.rb ./config/

VOLUME /app/db/database

RUN bin/rake assets:precompile

EXPOSE 3000

ENTRYPOINT ["bundle", "exec"]
CMD ["rails", "server", "-b", "0.0.0.0"]
