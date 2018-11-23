# Docker Image Builder v2
#
# These images are built using Dockerfile inheritance to build the images used for Probo.CI.
#
# Image: proboci/ubuntu
# Tag: 18.04
# 
# The default Node.js version is 8.x in Ubuntu 18.04. 
# The npm package is also required for Ubuntu 18.04.
#
# Build the proboci/ubuntu:18.04 image:tag with the following command from inside the src/ubuntu/18.04 directory where the Dockerfile lives:
# docker build -t proboci/ubuntu:18.04

FROM ubuntu:18.04

WORKDIR /root

RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y apt-utils \
	apt-transport-https \
	build-essential \
	ca-certificates \
	curl \
	git \
	libnss3 \
	lsb-release \
	nano \
	netcat-openbsd \
	nodejs \
	npm \
	ntp \
	sendmail \
	software-properties-common \
	sudo \
	vim \
	wget \
	zip

RUN add-apt-repository ppa:ondrej/php
RUN apt install -y \
	mariadb-server \
	php7.1 \
	php7.1-bcmath \
	php7.1-bz2 \
	php7.1-cli \
	php7.1-common \
	php7.1-curl \
	php7.1-dba \
	php7.1-dev \
	php7.1-gd \
	php7.1-json \
	php7.1-ldap \
	php7.1-mbstring \
	php7.1-mcrypt \
	php7.1-mysql \
	php7.1-opcache \
	php7.1-readline \
	php7.1-soap \
	php7.1-xml \
	php7.1-zip \
	php7.1-pgsql \
	php-memcached \
	libapache2-mod-php7.1 \
	php-redis \
	php-imagick \
	php-pear \
	php-uploadprogress \
	imagemagick \
	postgresql \
	postgresql-contrib \
	apache2 \
	apache2-utils \
	libsqlite3-dev \
	ruby-dev

RUN apt install zlib1g-dev

#RUN gem install rails
#RUN gem install mailcatcher

# Install Composer and Drush
RUN curl -sS https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin \
    --filename=composer \
    --version=1.7.3 && \
    composer \
    --working-dir=/usr/local/src/ \
    global \
    require \
    drush/drush:8.* && \
    ln -s /usr/local/src/vendor/bin/drush /usr/bin/drush

RUN curl https://drupalconsole.com/installer -L -o /drupal.phar
RUN mv /drupal.phar /bin/drupal
RUN chmod 755 /bin/drupal

RUN apt install -y npm

RUN npm install -g proboscis \
  && ln -s /usr/lib/node_modules/proboscis/bin/proboscis /usr/bin/proboscis \
  && ln -s /usr/lib/node_modules/proboscis/bin/proboscis-control /usr/bin/proboscis-control \
  && ln -s /usr/lib/node_modules/proboscis/bin/proboscis-format /usr/bin/proboscis-format \
  && rm -rf /var/lib/apt/lists/* /tmp/*

COPY files/apache-default-host.conf /etc/apache2/conf-enabled/apache-default-host.conf

RUN rm -rf /var/www/html

#RUN su postgres -c "createuser -d -l -r -s root"
#RUN su postgres -c "createdb --owner=root drupal"

COPY files/my.cnf.j2 /root/.my.cnf
RUN chmod 600 /root/.my.cnf
COPY files/mysql-setup.sql /mysql-setup.sql
RUN mysql -uroot < /mysql-setup.sql

RUN mkdir .ssh \
  && chmod 700 .ssh
