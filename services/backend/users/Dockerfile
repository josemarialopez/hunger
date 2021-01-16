FROM ruby:2.6.3
WORKDIR /service
COPY Gemfile ./
RUN bundle install
COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]