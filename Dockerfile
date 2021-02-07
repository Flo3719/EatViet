FROM ruby:3.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /stonks
COPY Gemfile /stonks/Gemfile
COPY Gemfile.lock /stonks/Gemfile.lock
COPY . /stonks

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]