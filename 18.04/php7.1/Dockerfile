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

# Set our our meta data for this container.

FROM ubuntu:18.04

LABEL name="Ubuntu 18.04 LTS Based ProboCI Image"
LABEL description="Our base container for ProboCI Builds."
LABEL author="Michael R. Bagnall <mrbagnall@icloud.com>"
LABEL vendor="ProboCI, LLC."

WORKDIR /root

ENV TERM xterm

RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y apt-utils \
	apt-transport-https \
	build-essential \
	ca-certificates \
	curl \
	git \
	libnss3 \
	lsb-release \
	memcached \
	nano \
	netcat-openbsd \
	nodejs \
	ntp \
	openjdk-8-jre \
	redis-server \
	sendmail \
	software-properties-common \
	sudo \
	vim \
	wget \
	zip

RUN add-apt-repository ppa:ondrej/php \
  && apt update -y

RUN apt install -y \
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
	imagemagick \
	postgresql \
	postgresql-contrib \
	apache2 \
	apache2-utils

# Install Composer and Drush
RUN curl -sS https://getcomposer.org/installer | php -- \
    --install-dir=/usr/bin \
    --filename=composer \
    --version=1.7.3 && \
    composer \
    --working-dir=/usr/local/src/ \
    global \
    require \
    drush/drush:8.* && \
    ln -s /usr/local/src/vendor/bin/drush /usr/bin/drush

# Download Drupal Console and install it in our standard path.
RUN curl https://drupalconsole.com/installer -L -o /drupal.phar
RUN mv /drupal.phar /bin/drupal
RUN chmod 755 /bin/drupal

# Get Node Package Manager
RUN apt install -y npm

# Install Proboscis
RUN npm install -g proboscis \
  && ln -s /usr/lib/node_modules/proboscis/bin/proboscis /usr/bin/proboscis \
  && ln -s /usr/lib/node_modules/proboscis/bin/proboscis-control /usr/bin/proboscis-control \
  && ln -s /usr/lib/node_modules/proboscis/bin/proboscis-format /usr/bin/proboscis-format \
  && rm -rf /var/lib/apt/lists/* /tmp/*

# Start and configure our PostgreSQL server
COPY files/pgpass.txt /root/.pgpass
RUN service postgresql start \
	&& su - postgres -c "createuser -d -l -r -s root" \
	&& su - postgres -c "createdb --owner=postgres drupal" \
	&& psql --username=root --dbname=drupal -c "ALTER USER root WITH PASSWORD 'strongpassword';" \
	&& chmod 600 /root/.pgpass \
	&& service postgresql stop

# Configure Apache. Be sure to enable apache mods or you're going to have a bad time.
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
  && a2enmod proxy_http
COPY files/apache-default-host.conf /etc/apache2/conf-enabled/apache-default-host.conf

# Start and configure our MySQL Server
RUN apt update -y
COPY files/mysql-setup.sql /mysql-setup.sql
RUN apt install -y mariadb-server mariadb-client
RUN service mysql start \
  && mysql -uroot < /mysql-setup.sql

RUN apt install -y libreadline-dev zlib1g-dev ruby-dev libsqlite3-dev \
  && gem install rails \
  && gem install mailcatcher

RUN wget http://archive.apache.org/dist/lucene/solr/6.6.5/solr-6.6.5.tgz \
	&& tar xzf solr-6.6.5.tgz solr-6.6.5/bin/install_solr_service.sh --strip-components=2 \
	&& ./install_solr_service.sh solr-6.6.5.tgz  \
	&& wget https://ftp.drupal.org/files/projects/search_api_solr-7.x-1.14.tar.gz \
	&& tar xzf search_api_solr-7.x-1.14.tar.gz \
	&& mv search_api_solr /opt/solr/. \
	&& sudo -u solr -- /opt/solr/bin/solr create -c drupal7 -d "/opt/solr/search_api_solr/solr-conf/6.x" \
	&& wget https://ftp.drupal.org/files/projects/search_api_solr-8.x-2.3.tar.gz \
	&& rm -rf /opt/solr/search_api_solr \
	&& tar xzf search_api_solr-8.x-2.3.tar.gz \
	&& mv search_api_solr /opt/solr/. \
	&& sudo -u solr -- /opt/solr/bin/solr create -c drupal8 -d "/opt/solr/search_api_solr/solr-conf/6.x" \
	&& service solr stop

RUN mkdir .ssh \
  && chmod 700 .ssh
