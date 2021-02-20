# Probo.CI Docker Ubuntu

This repository is used to store the latest Ubuntu LTS (18.04 LTS) installation and configuration settings for automating Docker image builds on the Docker Hub. The Docker images built from this repository are developed specifically to be used as Docker images that run the build containers for [Probo.CI](https://probo.ci).

The [proboci/ubuntu](https://hub.docker.com/u/proboci/ubuntu) Docker image [tags](https://hub.docker.com/r/proboci/ubuntu/tags) currently are built off of a corresponding Git branch in this repository as detailed below.

| Docker Image Tag  | Git Branch |
| ------------- | ------------- |
| proboci/ubuntu:18.04-php5.6  | [18.04-php5.6](https://github.com/ProboCI/docker-ubuntu/tree/18.04-php5.6)  |
| proboci/ubuntu:18.04-php7.0  | [18.04-php7.0](https://github.com/ProboCI/docker-ubuntu/tree/18.04-php7.0)  |
| proboci/ubuntu:18.04-php7.1  | [18.04-php7.1](https://github.com/ProboCI/docker-ubuntu/tree/18.04-php7.1)  |
| proboci/ubuntu:18.04-php7.2  | [18.04-php7.2](https://github.com/ProboCI/docker-ubuntu/tree/18.04-php7.2)  |
| proboci/ubuntu:18.04-php7.3  | [18.04-php7.3](https://github.com/ProboCI/docker-ubuntu/tree/18.04-php7.3)  |
| proboci/ubuntu:18.04-php7.4  | [18.04-php7.4](https://github.com/ProboCI/docker-ubuntu/tree/18.04-php7.4)  |
| proboci/ubuntu:18.04-php8.0  | [18.04-php8.0](https://github.com/ProboCI/docker-ubuntu/tree/18.04-php8.0)  |

**Note:** Image builds for Ubuntu 14.04 LTS and Ubuntu 16.04 LTS have been deprecated in favor of maintaining the latest Ubuntu LTS with specific images available for PHP versions and MySQL versions. Code in the [archived](https://github.com/ProboCI/docker-ubuntu/tree/master/archived) directory should be ignored, and will be deleted at some point.

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

We have some images with deprecated versions of PHP available to use for older projects, but we only provide Probo support for officially supported PHP versions, https://www.php.net/supported-versions (PHP 7.2, 7.3. 7.4).

- ~~PHP 5.5~~ (Unsupported as of Jul 21 2016)
- ~~PHP 5.6~~ (Unsupported as of Dec 31 2018)
- ~~PHP 7.0~~ (Unsupported as of Jan 10 2019)
- ~~PHP 7.1~~ (Unsupported as of Dec 1 2019)
- PHP 7.2 (Default)
  - PHP 7.2 Extensions & Packages Installed
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
  - PHP 7.3 Extensions & Packages Installed
    - php7.3-bcmath
    - php7.3-bz2
    - php7.3-cli
    - php7.3-common
    - php7.3-curl
    - php7.3-dba
    - php7.3-dev
    - php7.3-gd
    - php7.3-json
    - php7.3-ldap
    - php7.3-mbstring
    - php7.3-mysql
    - php7.3-opcache
    - php7.3-readline
    - php7.3-soap
    - php7.3-xml
    - php7.3-zip
    - php7.3-pgsql
    - php-memcached
    - libapache2-mod-php7.3
    - php-redis
    - php-imagick
    - php-pear
- PHP 7.4
  - PHP 7.4 Extensions & Packages Installed
    - php7.4-bcmath
    - php7.4-bz2
    - php7.4-cli
    - php7.4-common
    - php7.4-curl
    - php7.4-dba
    - php7.4-dev
    - php7.4-gd
    - php7.4-json
    - php7.4-ldap
    - php7.4-mbstring
    - php7.4-mysql
    - php7.4-opcache
    - php7.4-readline
    - php7.4-soap
    - php7.4-xml
    - php7.4-zip
    - php7.4-pgsql
    - php-memcached
    - libapache2-mod-php7.4
    - php-redis
    - php-imagick
    - php-pear
- PHP 8.0
  - PHP 8.0 Extensions & Packages Installed
    - php7.4-bcmath
    - php7.4-bz2
    - php7.4-cli
    - php7.4-common
    - php7.4-curl
    - php7.4-dba
    - php7.4-dev
    - php7.4-gd
    - php7.4-ldap
    - php7.4-mbstring
    - php7.4-mysql
    - php7.4-opcache
    - php7.4-readline
    - php7.4-soap
    - php7.4-xml
    - php7.4-zip
    - php7.4-pgsql
    - php-memcached
    - libapache2-mod-php7.4
    - php-redis
    - php-imagick
    - php-pear

## Node.JS Version
- Node 12.x (Default)

## PostgreSQL Version
- PostgreSQL 10

## Ruby Version
- Ruby 2.x (Default)

## Solr Version
- Apache Solr 7.7.3 (Default)
  - Search API Solr module installed for Drupal 7, 8 and 9.
  - Default Solr cores available for Drupal 7, 8 and 9.
    - drupal7
    - drupal8 (note use this for both Drupal 8 and 9 installs)

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
