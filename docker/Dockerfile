FROM ruby:3.1.2

# Install Ruby on Rails dependencies
RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    less \
    git \
    libpq-dev \
    postgresql-client \
    postgresql-client-common \
    libvips42 \
    curl \
    unzip \
    wget \
    tar \
    openssl \
    zlib1g-dev \
    libssl-dev \
    libreadline-dev \
    libreadline6-dev \
    libyaml-dev \
    libxml2-dev \
    libxslt1-dev \
    libcurl4-openssl-dev \
    libffi-dev \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg && apt-key add /root/yarn-pubkey.gpg
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y --no-install-recommends nodejs yarn

# Install Google Chrome
WORKDIR /tmp
RUN apt-get install -y wget
RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt-get install -y ./google-chrome-stable_current_amd64.deb
RUN rm -f google-chrome-stable_current_amd64.deb

# Default directory
ENV INSTALL_PATH /opt/app
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

RUN gem install bundler

COPY . ./
RUN rm -rf node_modules vendor

RUN bundle install
RUN yarn install

ENTRYPOINT ["./docker/entrypoints/docker-entrypoint.sh"]

# Expose port 3000 to allow us to access the site in our broser with localhost:3000
EXPOSE 3000

# Start rails server
CMD ["rails", "s", "-b", "0.0.0.0"]

USER $USER