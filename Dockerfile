FROM ruby:3.1.2-slim

RUN apt-get update && \
  apt-get install -y ca-certificates lsb-release wget ruby-dev curl libc6-dev libvips git build-essential pkg-config

RUN apt-get install -y libpq-dev
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
RUN apt-get update && apt-get install nodejs -y

RUN npm install -g esbuild yarn
RUN mkdir -p /app
WORKDIR /app
COPY . /app
RUN gem install bundler
RUN bundle install --without development test
RUN yarn install
EXPOSE 3000

RUN bundle exec rails \
  DATABASE_URL=postgresql:does_not_exist \
  SECRET_KEY_BASE=placeholder \
  RAILS_ENV=production \
  assets:precompile

ENV RAILS_ENV production
ENV RAILS_LOG_TO_STDOUT true
ENV RAILS_SERVE_STATIC_FILES true

CMD ["rails", "s"]
