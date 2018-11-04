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

ARG GIT_HASH
ENV GIT_HASH ${GIT_HASH:-418553b546d74a07874250f3495878846419a603}

ENV RAILS_ENV development
ENV RACK_ENV development
ENV NODE_ENV production

RUN git clone https://github.com/snibox/snibox.git /app && cd /app && git reset --hard $GIT_HASH

COPY . /app

RUN gem install bundler && bundle install

VOLUME /app/db/database

RUN bin/rake assets:precompile

EXPOSE 3000

ENTRYPOINT ["bundle", "exec"]
CMD ["rails", "server", "-b", "0.0.0.0"]
