# Docker Image Builder v2
#
# These images are built using Dockerfile inheritance to build the images used for Probo.CI.
#
# Image: proboci/ubuntu
# Tag: 18.04-php7.2
# 
# The default Node.js version on this build is 12.18.0
# The npm package is v6.14.4 as updated as part of NodeJS 12.
#
# Build the proboci/ubuntu:18.04 image:tag with the following command from inside the src/ubuntu/18.04 directory where the Dockerfile lives:
# docker build . -t proboci/ubuntu:18.04-php7.2
# docker push proboci/ubuntu:18.04-php7.2

# Set our our meta data for this container.

FROM ubuntu:18.04

LABEL name="Ubuntu 18.04 LTS Based ProboCI Image"
LABEL description="Our base container for ProboCI Builds."
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
  libxml2-dev \
  pv

RUN apt-get install -y bzip2 libbz2-dev libcurl4-openssl-dev libgd-dev imagemagick libldap-dev libssl-dev

RUN apt-get install -y libapr1-dev libaprutil1-dev && \
  cd /root && \
  wget -N https://dlcdn.apache.org//httpd/httpd-2.4.52.tar.gz && \
  tar -xvzf httpd-2.4.52.tar.gz && \
  cd httpd-2.4.52 && \
  ./configure --prefix=/usr && \
  make && make install

RUN wget -N https://prototype.php.net/distributions/php-7.2.32.tar.gz && \
  tar -xvzf php-7.2.32.tar.gz && \
  cd php-7.2.32 && \
  ./configure --enable-bcmath --with-bz2 --enable-cli --with-curl \
    --enable-dba --with-gd --enable-json --enable-mbstring --with-pdo-mysql \
    --enable-xml --enable-zip --with-ldap --with-openssl --with-apxs2=/usr/bin/apxs
RUN cd php-7.2.32 && make && make install

RUN apt-get install -y cmake libncurses5-dev

RUN wget -N https://archive.mariadb.org/mariadb-10.1.40/source/mariadb-10.1.40.tar.gz && \
  tar -xvzf mariadb-10.1.40.tar.gz && \
  cd mariadb-10.1.40 && \
  cmake .

RUN cd mariadb-10.1.40 && \
  make && \
  make install

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
COPY files/versionizer.php /versionizer.php
RUN wget -O /usr/local/src/drush-launcher/drush https://github.com/drush-ops/drush-launcher/releases/latest/download/drush.phar
RUN chmod +x /usr/local/src/drush-launcher/drush
RUN echo "\n\ndrush() { \n/usr/local/bin/drush -r /var/www/html \$@ \n }" >> /root/.bashrc
RUN echo "\n\nversionizer() { \nphp /versionizer.php\n }" >> /root/.bashrc

# Install Proboscis
RUN npm install -g proboscis --unsafe

# Install NPM Packages.
RUN npm config set unsafe-perm true
RUN npm install -g bower \
  grunt-cli \
  gulp-cli \
  lighthouse \
  yarn \
  cypress \
  --no-document

# # Configure Apache. Be sure to enable apache mods or you're going to have a bad time.
# RUN rm -rf /var/www/html \
#   && a2enmod rewrite \
#   && a2enmod actions \
#   && a2enmod alias \
#   && a2enmod deflate \
#   && a2enmod dir \
#   && a2enmod expires \
#   && a2enmod headers \
#   && a2enmod mime \
#   && a2enmod negotiation \
#   && a2enmod setenvif \
#   && a2enmod proxy \
#   && a2enmod proxy_http \
#   && service apache2 stop
# COPY files/apache-default-host.conf /etc/apache2/sites-enabled/000-default.conf
# COPY files/apache-default-varnish-host.conf /etc/apache2/sites-available/000-default-varnish.conf
# COPY files/listen_8080.conf /etc/apache2/conf-available/listen_8080.conf

# Install solr with default search cores.
RUN  wget https://proofroom.s3.amazonaws.com/solr-8.6.3.tgz \
  && tar xzf solr-8.6.3.tgz solr-8.6.3/bin/install_solr_service.sh --strip-components=2 \
  && ./install_solr_service.sh solr-8.6.3.tgz \
  && wget https://ftp.drupal.org/files/projects/search_api_solr-4.2.3.tar.gz \
  && rm -rf /opt/solr/search_api_solr \
  && tar xzf search_api_solr-4.2.3.tar.gz \
  && mv search_api_solr /opt/solr/. \
  && sudo -u solr -- /opt/solr/bin/solr create -c drupal8 -d "/opt/solr/search_api_solr/jump-start/solr8/config-set" \
  && service solr stop

# Create .ssh dir and add SSH config file.
# TODO: There's got to be a better way to setup the /root/.ssh/config file. Using old method for now.
RUN mkdir /root/.ssh \
  && chmod 700 /root/.ssh \
  && touch /root/.ssh/config \
  && chmod 0700 /root/.ssh/config \
  && echo "Host *" >> /root/.ssh/config \
  && echo "StrictHostKeyChecking no" >> /root/.ssh/config

# The following assumes that the 'mysql' user exists and that we installed MariaDB
# in /usr/local/mysql

# Install apt packages for LAMP, npm, ruby, and all other tools available from apt.
COPY files/mysql-setup.sql /mysql-setup.sql
RUN cp /usr/local/mysql/support-files/mysql.server /etc/init.d/mysql

RUN useradd mysql && \
  chown -R mysql /usr/local/mysql/ && \
  cd /usr/local/mysql/ && \
  /usr/local/mysql/scripts/mysql_install_db --user=mysql

RUN cd /usr/local/mysql/ && \
  #/usr/local/mysql/bin/mysql -e "UPDATE mysql.user SET Password = PASSWORD('CHANGEME') WHERE User = 'root'" && \
  bin/mysqld_safe --user=mysql  & \
  sleep 10 && \
  /usr/local/mysql/bin/mysql < /mysql-setup.sql && \
  pkill mysql

COPY files/mycnf.txt /root/.my.cnf

RUN cd ~ && \
  rm solr-8.6.3.tgz && \
  rm -rf solr-8.6.3 && \
  rm mariadb-10.1.40.tar.gz && \
  rm -rf mariadb-10.1.40

ENV PATH /usr/local/mysql/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/var/www/html/vendor/drush/drush:vendor/drush/drush:/var/www/html/drush/drush

RUN cd /usr/local/lib && \
  wget -O php.ini https://gist.githubusercontent.com/ElusiveMind/5ab1903fc359535337daed1eb2b8e98e/raw/2679e5fd19138eba6ed0554809286df1b289da4a/php.ini

COPY files/apache-default-host.conf /usr/conf/extra/000-default.conf

RUN mkdir -p /var/www
RUN echo 'Include /usr/conf/extra/000-default.conf' >> /usr/conf/httpd.conf