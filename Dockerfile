FROM ruby:3.1.2
WORKDIR /app

RUN apt-get update && \
    apt-get install sqlite3 

COPY ./Gemfile* ./
RUN gem update bundler && \
    bundle install

COPY . .
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
