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
VOLUME /app
WORKDIR /app
RUN gem install bundler
EXPOSE 3000
