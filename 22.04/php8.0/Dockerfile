# Docker Image Builder v2
#
# These images are built using Dockerfile inheritance to build the images used for Probo.CI.
#
# Image: proboci/ubuntu
# Tag: 22.04-php8.0
# 
# The default Node.js version on this build is 12.18.0
# The npm package is v6.14.4 as updated as part of NodeJS 12.
#
# Build the proboci/ubuntu:22.04 image:tag with the following command from inside the src/ubuntu/18.04 directory where the Dockerfile lives:
# docker build . -t proboci/ubuntu:22.04-php8.0
# docker push proboci/ubuntu:22.04-php8.0

# Set our our meta data for this container.

FROM ubuntu:22.04

LABEL name="Ubuntu 22.04 LTS PHP 8.0 Probo.CI Image"
LABEL description="An Ubuntu 22.04 based PHP 8.0 image developed specifically for docker containers running Probo.CI Builds."
LABEL author="Michael R. Bagnall <michael@bagnall.io>"
LABEL vendor="ProboCI, LLC."

WORKDIR /root

ENV TERM=xterm

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/var/www/html/vendor/drush/drush:vendor/drush/drush:/var/www/html/drush/drush:/var/www/html/docroot/vendor/drush/drush:/src/vendor/drush/drush:/usr/local/src/aws

# Update to NodeJS 16 and install nvm for supporting other versions.
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install curl dirmngr apt-transport-https lsb-release ca-certificates sudo apt-utils wget gnupg && \
  mkdir -p /etc/apt/keyrings && \
  curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
  echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_16.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list

RUN apt-get -y update
RUN apt-get -y install perl psmisc libaio1 libmecab2 libnuma1 libtinfo5

# Update apt repos and install base apt packages.
RUN apt-get -y update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  build-essential \
  git \
  gnupg \
  libnss3 \
  memcached \
  nano \
  netcat-openbsd \
  nodejs \
  ntp \
  openjdk-8-jre \
  redis-server \
  nullmailer \
  software-properties-common \
  sudo \
  vim \
  wget \
  zip \
  gcc \
  g++ \
  make \
  cpanminus \
  lsof \
  rsync \
  pv \
  lsb-core \
  sqlite3 \
  errno

RUN rm /usr/bin/vi && \
  ln -s /usr/bin/vim /usr/bin/vi

RUN add-apt-repository ppa:ondrej/php \
  && apt-get update && apt upgrade -y && DEBIAN_FRONTEND=noninteractive apt-get install -y php8.0 \
  php8.0-bcmath \
  php8.0-bz2 \
  php8.0-cli \
  php8.0-common \
  php8.0-curl \
  php8.0-dba \
  php8.0-gd \
  php8.0-intl \
  php8.0-ldap \
  php8.0-mbstring \
  php8.0-mysql \
  php8.0-opcache \
  php8.0-readline \
  php8.0-soap \
  php8.0-xml \
  php8.0-zip \
  php8.0-pgsql \
  php8.0-memcache \
  php8.0-redis \
  php8.0-imagick \
  php8.0-sqlite3 \
  libapache2-mod-php8.0 \
  imagemagick \
  postgresql \
  postgresql-contrib \
  mariadb-server \
  mariadb-client \
  apache2 \
  apache2-utils \
  libjemalloc2

COPY files/envvars /envvars
COPY files/envvars-swap.sh /envvars-swap.sh

COPY files/mysql-setup.sql /mysql-setup.sql
COPY files/mycnf.txt /root/.my.cnf
COPY files/probo.cnf .my.cnf
COPY files/probo-mysql.cnf /etc/mysql/mariadb.conf.d/probo.cnf
COPY files/mysql /etc/init.d/mysql
RUN chmod 755 /etc/init.d/mysql
RUN service mariadb start \
  && mysql -uroot < /mysql-setup.sql \
  && rm -rf /tmp/* /mysql-setup.sql

RUN apt-get install -y \
  libreadline-dev \
  zlib1g-dev \
  ruby-dev \
  libsqlite3-dev \
  xvfb \
  libgconf-2-4

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- \
  --install-dir=/usr/local/bin \
  --filename=composer

# Software version checker and valid user checker
COPY files/versionizer.php /bin/versionizer
COPY files/valid-user.sh /bin/valid
RUN chmod 755 /bin/valid /bin/versionizer

# Add our ability to pull from AWS S3
COPY s3/aws-retrieval /usr/local/src/aws
RUN chmod +x /usr/local/src/aws/retrieve-from-aws.php

# Install Proboscis
RUN npm install -g proboscis --unsafe

# Start and configure our PostgreSQL server.
COPY files/pgpass.txt /root/.pgpass
RUN service postgresql start \
  && su - postgres -c "createuser -d -l -r -s root" \
  && su - postgres -c "createdb --owner=postgres drupal" \
  && psql --username=root --dbname=drupal -c "ALTER USER root WITH PASSWORD 'strongpassword';" \
  && chmod 0600 /root/.pgpass \
  && service postgresql stop

# Configure Apache. Be sure to enable apache mods or you're going to have a bad time.
COPY files/ssl_environment_variable.conf /etc/apache2/conf-available/ssl_environment_variable.conf
RUN rm -rf /var/www/html \
  && a2enmod rewrite \
  && a2enmod actions \
  && a2enmod alias \
  && a2enmod deflate \
  && a2enmod dir \
  && a2enmod expires \
  && a2enmod headers \
  && a2enmod mime \
  && a2enmod negotiation \
  && a2enmod setenvif \
  && a2enmod proxy \
  && a2enmod proxy_http \
  && a2enconf ssl_environment_variable \
  && service apache2 stop
COPY files/apache-default-host.conf /etc/apache2/sites-available/000-default.conf
COPY files/apache-default-host.conf /etc/apache2/sites-enabled/000-default.conf
COPY files/apache-default-varnish-host.conf /etc/apache2/sites-available/000-default-varnish.conf
COPY files/listen_8080.conf /etc/apache2/conf-available/listen_8080.conf

# Install solr with default search cores.
RUN wget https://probosupportfiles.blob.core.windows.net/solr/solr-7.7.3.tgz \
  && tar xzf solr-7.7.3.tgz solr-7.7.3/bin/install_solr_service.sh --strip-components=2 \
  && ./install_solr_service.sh solr-7.7.3.tgz \
  && wget https://ftp.drupal.org/files/projects/search_api_solr-7.x-1.17.tar.gz \
  && tar xzf search_api_solr-7.x-1.17.tar.gz \
  && mv search_api_solr /opt/solr/. \
  && sudo -u solr -- /opt/solr/bin/solr create -c drupal7 -d "/opt/solr/search_api_solr/solr-conf/7.x" \
  && wget https://ftp.drupal.org/files/projects/search_api_solr-4.3.5.tar.gz \
  && rm -rf /opt/solr/search_api_solr \
  && tar xzf search_api_solr-4.3.5.tar.gz \
  && mv search_api_solr /opt/solr/. \
  && sudo -u solr -- /opt/solr/bin/solr create -c drupal8 -d "/opt/solr/search_api_solr/jump-start/solr7/config-set" \
  && sudo -u solr -- /opt/solr/bin/solr create -c drupal -d "/opt/solr/search_api_solr/jump-start/solr7/config-set" \
  && service solr stop

RUN curl -fsSL https://packagecloud.io/varnishcache/varnish70/gpgkey|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/varnish.gpg && \
  echo "deb https://packagecloud.io/varnishcache/varnish70/ubuntu/ focal main" > /etc/apt/sources.list.d/varnishcache_varnish70.list && \
  echo "deb-src https://packagecloud.io/varnishcache/varnish70/ubuntu/ focal main" >> /etc/apt/sources.list.d/varnishcache_varnish70.list
RUN apt-get update -y && \
  apt-get install varnish

# Install varnish default configs.
COPY files/wordpress-default-4.vcl /etc/varnish/wordpress-default.vcl
COPY files/drupal-default-4.vcl /etc/varnish/drupal-default.vcl
COPY files/secret /etc/varnish/secret

# Fly in our Drush script for sanitizing the database which removes
# a lot of revision, cache, watchdog, and search data.
COPY files/database_sanitize.php /opt/database_sanitize.php

# Create .ssh dir and add SSH config file.
# TODO: There's got to be a better way to setup the /root/.ssh/config file. Using old method for now.
RUN mkdir /root/.ssh \
  && chmod 700 /root/.ssh \
  && touch /root/.ssh/config \
  && chmod 0700 /root/.ssh/config \
  && echo "Host *" >> /root/.ssh/config \
  && echo "StrictHostKeyChecking no" >> /root/.ssh/config

# Install Terminus Pantheon command line tool, https://pantheon.io/docs/terminus.
RUN cd /opt \
  && curl -L https://github.com/pantheon-systems/terminus/releases/download/3.5.2/terminus.phar --output terminus \
  && chmod +x terminus \
  && ln -s /opt/terminus /usr/local/bin/terminus \
  && cd

# Install WP-CLI Wordpress command line tool, https://wp-cli.org/.
RUN curl -o /tmp/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x /tmp/wp-cli.phar \
  && mv /tmp/wp-cli.phar /usr/local/bin/wp

RUN curl -OL https://github.com/acquia/cli/releases/latest/download/acli.phar \
  && chmod +x acli.phar \
  && mv acli.phar /usr/local/bin/acli

RUN cd /root && \
  wget https://github.com/ElusiveMind/bee/archive/refs/heads/bugfix/default-context-value.zip && \
  unzip default-context-value.zip && \
  mv bee-bugfix-default-context-value bee && \
  cd /usr/local/bin && \
  ln -s /root/bee/bee.php bee && \
  chmod -R 755 /root/bee/bee.php && \
  cd

RUN rm -rf install_solr_service.sh \
  search_api_solr-4.3.5.tar.gz \
  search_api_solr-7.x-1.17.tar.gz \
  solr-7.7.3.tgz \
  default-context-value.zip
