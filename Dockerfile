FROM ruby:3.0.0

RUN apt-get update -qq && apt-get install -y nodejs npm\
  && rm -rf /var/lib/apt/lists/* \
  && curl -o- -L https://yarnpkg.com/install.sh | bash

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install
RUN npm install -g yarn
RUN yarn install --check-files

COPY command.sh /usr/bin/

RUN chmod +x /usr/bin/command.sh

ENTRYPOINT ["command.sh"]

EXPOSE 3000
