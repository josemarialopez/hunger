FROM ruby:2.6.3
RUN bundle config --global frozen 1
WORKDIR /service
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]