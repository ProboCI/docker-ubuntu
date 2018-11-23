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


RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y apt-utils \
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
	zip \
  && rm -rf /var/lib/apt/lists/* /tmp/*

RUN apt-get install -y \
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

RUN gem install rails && gem install mailcatcher

RUN npm install -g proboscis \
  && ln -s /usr/lib/node_modules/proboscis/bin/proboscis /usr/bin/proboscis \
  && ln -s /usr/lib/node_modules/proboscis/bin/proboscis-control /usr/bin/proboscis-control \
  && ln -s /usr/lib/node_modules/proboscis/bin/proboscis-format /usr/bin/proboscis-format \
  && rm -rf /var/lib/apt/lists/* /tmp/*

RUN mkdir .ssh \
  && chmod 700 .ssh
