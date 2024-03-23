# Docker Image Builder v2
#
# These images are built using Dockerfile inheritance to build the images used for Probo.CI.
#
# Image: proboci/ubuntu
# Tag: 18.04-php7.3
# 
# The default Node.js version on this build is 12.18.0
# The npm package is v6.14.4 as updated as part of NodeJS 12.
#
# Build the proboci/ubuntu:18.04 image:tag with the following command from inside the src/ubuntu/18.04 directory where the Dockerfile lives:
# docker build . -t proboci/ubuntu:18.04-php7.3
# docker push proboci/ubuntu:18.04-php7.3

# Set our our meta data for this container.

FROM ubuntu:18.04

LABEL name="Ubuntu 18.04 LTS PHP 7.3 Probo.CI Image"
LABEL description="An Ubuntu 18.04 based PHP 7.3 image developed specifically for docker containers running Probo.CI Builds."
LABEL author="Michael R. Bagnall <mbagnall@zivtech.com>"
LABEL vendor="ProboCI, LLC."

WORKDIR /root

ENV TERM xterm

RUN apt-get -y update
RUN apt-get -y install curl dirmngr apt-transport-https lsb-release ca-certificates sudo apt-utils
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

# Update apt repos and install base apt packages.
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
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
  lsb-core

RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8 && \
  add-apt-repository 'deb [arch=amd64] http://mirrors.accretive-networks.net/mariadb/repo/10.3/ubuntu bionic main' && \
  apt-get -y update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y \
  mariadb-server \
  mariadb-client

# Install apt packages for LAMP, varnish, npm, ruby, and all other tools available from apt.
COPY files/varnishcache_varnish41.list /etc/apt/sources.list.d/varnishcache_varnish41.list
RUN curl -L https://packagecloud.io/varnishcache/varnish41/gpgkey | APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn apt-key add - \
  && add-apt-repository ppa:ondrej/php \
  && apt-get update && apt upgrade -y && DEBIAN_FRONTEND=noninteractive apt-get install -y php7.3 \
  php7.3-bcmath \
  php7.3-bz2 \
  php7.3-cli \
  php7.3-common \
  php7.3-curl \
  php7.3-dba \
  php7.3-dev \
  php7.3-gd \
  php7.3-json \
  php7.3-ldap \
  php7.3-mbstring \
  php7.3-mysql \
  php7.3-opcache \
  php7.3-readline \
  php7.3-soap \
  php7.3-xml \
  php7.3-zip \
  php7.3-pgsql \
  php7.3-memcache \
  php7.3-redis \
  php7.3-imagick \
  libapache2-mod-php7.3 \
  imagemagick \
  postgresql \
  postgresql-contrib \
  apache2 \
  apache2-utils

RUN apt-get install -y \
  libreadline-dev \
  zlib1g-dev \
  ruby-dev \
  libsqlite3-dev \
  varnish

COPY files/mysql-setup.sql /mysql-setup.sql
COPY files/probo-mysql.cnf /etc/mysql/mysql.conf.d/probo-mysql.cnf
RUN service mysql start && \
  mysql -uroot < /mysql-setup.sql
RUN service varnish stop
RUN rm -rf /tmp/* /mysql-setup.sql
COPY files/mycnf.txt /root/.my.cnf

RUN cd /root && \
  wget https://proofroom.s3.amazonaws.com/google-chrome-stable_current_amd64.deb && \
  wget https://proofroom.s3.amazonaws.com/chromedriver_linux64.zip && \
  unzip chromedriver_linux64.zip && \
  mv chromedriver /usr/local/bin/. && \
  apt install -y ./google-chrome-stable_current_amd64.deb

# Install composer and drush.
RUN mkdir /usr/local/src/drush9
RUN mkdir /usr/local/src/drush8
RUN mkdir /usr/local/src/drush-launcher
RUN curl -sS https://getcomposer.org/installer | php -- \
  --install-dir=/usr/local/bin \
  --filename=composer \
  && composer \
  --working-dir=/usr/local/src/drush9 \
  global \
  require \
  drush/drush:9.* \
  && composer \
  --working-dir=/usr/local/src/drush8 \
  global \
  require \
  drush/drush:8.* \
  && mkdir /etc/drush \
  && mkdir /etc/drush/conf.d
COPY files/drush-environment.php /etc/drush/conf.d/environment.php
COPY files/drushrc.php /etc/drush/drushrc.php
COPY files/versionizer.php /bin/versionizer
COPY files/valid-user.sh /bin/valid
RUN chmod 755 /bin/valid /bin/versionizer
RUN wget -O /usr/local/src/drush-launcher/drush https://github.com/drush-ops/drush-launcher/releases/latest/download/drush.phar
RUN chmod +x /usr/local/src/drush-launcher/drush
RUN echo "\n\ndrush() { \n/usr/local/bin/drush -r /var/www/html \$@ \n }" >> /root/.bashrc

# Download Drupal Console and install it in our standard path.
RUN curl https://drupalconsole.com/installer -L -o /drupal.phar \
  && mv /drupal.phar /bin/drupal \
  && chmod 755 /bin/drupal

# Install Proboscis
RUN npm install -g proboscis --unsafe

# Install yarn
RUN npm install -g yarn

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
RUN wget https://proofroom.s3.amazonaws.com/solr-7.3.1.tgz \
  && tar xzf solr-7.3.1.tgz solr-7.3.1/bin/install_solr_service.sh --strip-components=2 \
  && ./install_solr_service.sh solr-7.3.1.tgz \
  && wget https://ftp.drupal.org/files/projects/search_api_solr-7.x-1.16.tar.gz \
  && tar xzf search_api_solr-7.x-1.16.tar.gz \
  && mv search_api_solr /opt/solr/. \
  && sudo -u solr -- /opt/solr/bin/solr create -c drupal7 -d "/opt/solr/search_api_solr/solr-conf/7.x" \
  && wget https://ftp.drupal.org/files/projects/search_api_solr-4.2.10.tar.gz \
  && rm -rf /opt/solr/search_api_solr \
  && tar xzf search_api_solr-4.2.10.tar.gz \
  && mv search_api_solr /opt/solr/. \
  && sudo -u solr -- /opt/solr/bin/solr create -c drupal8 -d "/opt/solr/search_api_solr/jump-start/solr7/config-set" \
  && service solr stop

# Install varnish default configs.
COPY files/wordpress-default-4.vcl /etc/varnish/wordpress-default.vcl
COPY files/drupal-default-4.vcl /etc/varnish/drupal-default.vcl
COPY files/default-4.vcl /etc/varnish/default.vcl
COPY files/varnish /etc/default/varnish
COPY files/secret /etc/varnish/secret

# Create .ssh dir and add SSH config file.
# TODO: There's got to be a better way to setup the /root/.ssh/config file. Using old method for now.
RUN mkdir /root/.ssh \
  && chmod 700 /root/.ssh \
  && touch /root/.ssh/config \
  && chmod 0700 /root/.ssh/config \
  && echo "Host *" >> /root/.ssh/config \
  && echo "StrictHostKeyChecking no" >> /root/.ssh/config

# Install Terminus Pantheon command line tool, https://pantheon.io/docs/terminus.
RUN mkdir ~/terminus && cd ~/terminus \
  && curl -L https://github.com/pantheon-systems/terminus/releases/download/2.6.4/terminus.phar --output terminus \
  && chmod +x terminus \
  && ln -s ~/terminus/terminus /usr/local/bin/terminus

# Install WP-CLI Wordpress command line tool, https://wp-cli.org/.
RUN curl -o /tmp/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x /tmp/wp-cli.phar \
  && mv /tmp/wp-cli.phar /usr/local/bin/wp

RUN cd /root && \
  wget https://github.com/ElusiveMind/bee/archive/refs/heads/bugfix/default-context-value.zip && \
  unzip default-context-value.zip && \
  mv bee-bugfix-default-context-value bee && \
  cd /usr/local/bin && \
  ln -s /root/bee/bee.php bee && \
  chmod -R 755 /root/bee/bee.php && \
  cd

RUN rm -rf chromedriver_linux64.zip \
  google-chrome-stable_current_amd64.deb \
  install_solr_service.sh \
  search_api_solr-4.2.10.tar.gz \
  search_api_solr-7.x-1.16.tar.gz solr-7.3.1.tgz
