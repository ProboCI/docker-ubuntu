# Probo.CI Docker Ubuntu

This repository is used to store Ubuntu specific versions and configuration settings for building automated image builds on the Docker Hub.

The images built from this repository are developed specifically to be used as Docker images that run the builds for [Probo.CI](https://probo.ci).

Supported Ubuntu versions (14.04 LTS, 16.04 LTS and 18.04 LTS) are located in their respective version directory, `14.04`, `16.04` and `18.04`.

**Note:** Support for Ubuntu 14.04 LTS and Ubuntu 16.04 LTS versions will be dropped when our 18.04 LTS images are released. The plan is to support only the latest Ubuntu LTS release moving forward with separate images being built for specific PHP versions, specific MySQL versions, Varnish enabled images, and more.

The Ubuntu Docker images and tags built from this repository are used as base images for other Probo.CI Docker images.

Note that varnish enabled containers are in the directories suffixed with -varnish such as `18.04-varnish`.

The Probo Ubuntu Docker images and tags built are located on the Docker Hub at: [https://hub.docker.com/u/proboci/ubuntu](https://hub.docker.com/u/proboci/ubuntu) and [https://hub.docker.com/r/mbagnall/ubuntu](https://hub.docker.com/r/mbagnall/ubuntu)

## Apache Version
- Apache 2.x (Default)
  - Apache 2.x Modules Enabled
    - rewrite
    - actions
    - alias
    - deflate
    - dir
    - expires
    - headers
    - mime
    - negotiation
    - setenvif
    - proxy
    - proxy-http

## MySQL Version (MariaDB)
- TBD

## PHP Versions Supported
PHP is installed from the `ondrej/php` PPA repository, https://launchpad.net/~ondrej/+archive/ubuntu/php.

- PHP 5.5 (Deprecated)
- PHP 5.6 (Deprecated)
- PHP 7.0
- PHP 7.1
- PHP 7.2 (Default)
  - PHP 7.2 Extension Packages Installed
    - php7.2-bcmath
    - php7.2-bz2
    - php7.2-cli
    - php7.2-common
    - php7.2-curl
    - php7.2-dba
    - php7.2-dev
    - php7.2-gd
    - php7.2-json
    - php7.2-ldap
    - php7.2-mbstring
    - php7.2-mysql
    - php7.2-opcache
    - php7.2-readline
    - php7.2-soap
    - php7.2-xml
    - php7.2-zip
    - php7.2-pgsql
    - php-memcached
    - libapache2-mod-php7.2
    - php-redis
    - php-imagick
    - php-pear

## Node.JS Version
- Node 8.x (Default)

## PostgreSQL Version
- TBD

## Ruby Version
- Ruby 2.x (Default)

## Solr Version
- Apache Solr 6.x (Default)
  - Search API Solr module installed for Drupal 7 and Drupal 8.
  - Default Solr cores available for Drupal 7 and Drupal 8.
    - drupal7
    - drupal8

## Additional Packages and Tools
The following packages and tools have been installed to all Probo Images to allow for additional functionality on images for building and testing web applications out of the box.

- bundler
- composer
- curl
- drupalconsole
- drush
- git
- google-chrome-stable
- grunt-cli
- gulp-cli
- imagemagick
- lighthouse
- memcached
- mailcatcher
- nano
- netcat-openbsd
- npm
- ntp
- openjdk-8-jre
- rails
- redis-server
- ruby-compass
- sendmail
- the-a11y-machine
- vim
- wget
- wp-cli
- yarn
- zip
