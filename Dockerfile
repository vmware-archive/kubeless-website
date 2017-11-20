FROM bitnami/ruby:2.3
LABEL maintainer "Bitnami Team <webdev@bitnami.com>"

# Ruby base template
COPY Gemfile* /app/
WORKDIR /app

# Install all the dependencies
RUN bundle install

CMD ["middleman", "server"]
