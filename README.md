# Probo.CI Docker Ubuntu

This repository is used to store the latest Ubuntu LTS (18.04 LTS) installation and configuration settings for automating Docker image builds on the Docker Hub. The Docker images built from this repository are developed specifically to be used as Docker images that run the build containers for [Probo.CI](https://probo.ci).

The [proboci/ubuntu](https://hub.docker.com/u/proboci/ubuntu) Docker image [tags](https://hub.docker.com/r/proboci/ubuntu/tags) currently are built off of a corresponding Git tag in this repository. Code in the [archived](https://github.com/ProboCI/docker-ubuntu/tree/master/archived) directory should be ignored, and will be deleted at some point.

| Docker Tag  | GitHub Tag |
| ------------- | ------------- |
| proboci/ubuntu:18.04-php5.6  | [18.04-php5.6](https://github.com/ProboCI/docker-ubuntu/tree/18.04-php5.6)  |
| proboci/ubuntu:18.04-php7.0  | [18.04-php7.0](https://github.com/ProboCI/docker-ubuntu/tree/18.04-php7.0)  |
| proboci/ubuntu:18.04-php7.1  | [18.04-php7.1](https://github.com/ProboCI/docker-ubuntu/tree/18.04-php7.1)  |
| proboci/ubuntu:18.04-php7.2  | [18.04-php7.2](https://github.com/ProboCI/docker-ubuntu/tree/18.04-php7.2)  |
| proboci/ubuntu:18.04-php7.3  | [18.04-php7.3](https://github.com/ProboCI/docker-ubuntu/tree/18.04-php7.3)  |

**Note:** Image builds for Ubuntu 14.04 LTS and Ubuntu 16.04 LTS have been discontinued in favor of maintaining the latest Ubuntu LTS with specific images available for PHP versions and MySQL versions.

The [proboci/ubuntu](https://hub.docker.com/u/proboci/ubuntu) Docker image [tags](https://hub.docker.com/r/proboci/ubuntu/tags) built from this repository are located on the Docker Hub at: [https://hub.docker.com/u/proboci/ubuntu](https://hub.docker.com/u/proboci/ubuntu) and [https://hub.docker.com/r/mbagnall/ubuntu](https://hub.docker.com/r/mbagnall/ubuntu)

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
PHP versions are installed from the [ondrej/php](https://launchpad.net/~ondrej/+archive/ubuntu/php) PPA repository.

- ~~PHP 5.5~~ (Deprecated!)
- PHP 5.6 (Soon to be deprecated!)
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
- PHP 7.3

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
