FROM ruby:3.3 AS base
WORKDIR /app

FROM base AS production
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
EXPOSE 3001
CMD ["ruby", "server.rb", "-o", "0.0.0.0", "-p", "3001"]