FROM ruby:3.3 AS base
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install

FROM base AS production
COPY . .
EXPOSE 3001
# CMD ["ruby", "server.rb", "-o", "0.0.0.0", "-p", "3001"]
["bundle", "exec", "rackup", "-o", "0.0.0.0", "-p", "3001"]