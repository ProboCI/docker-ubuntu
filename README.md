# Probo.CI Docker Ubuntu

This repository is used to store the latest Ubuntu LTS (18.04 & 20.04) installations and configuration settings. The Docker images built from this repository are developed specifically to be used as Docker images that run the build containers for [Probo.CI](https://probo.ci).

The [proboci/ubuntu](https://hub.docker.com/u/proboci/ubuntu) Docker image [tree](https://hub.docker.com/r/proboci/ubuntu/tree/master) currently are built off of a corresponding Git branch in this repository as detailed below.

| Docker Image Tag  | Git Branch |
| ------------- | ------------- |
| proboci/ubuntu:18.04-php5.6  | [18.04-php5.6](https://github.com/ProboCI/docker-ubuntu/tree/master/18.04/php5.6) |
| proboci/ubuntu:18.04-php7.0  | [18.04-php7.0](https://github.com/ProboCI/docker-ubuntu/tree/master/18.04/php7.0) |
| proboci/ubuntu:18.04-php7.1  | [18.04-php7.1](https://github.com/ProboCI/docker-ubuntu/tree/master/18.04/php7.1) |
| proboci/ubuntu:18.04-php7.2  | [18.04-php7.2](https://github.com/ProboCI/docker-ubuntu/tree/master/18.04/php7.2) |
| proboci/ubuntu:18.04-php7.3  | [18.04-php7.3](https://github.com/ProboCI/docker-ubuntu/tree/master/18.04/php7.3) |
| proboci/ubuntu:18.04-php7.4  | [18.04-php7.4](https://github.com/ProboCI/docker-ubuntu/tree/master/18.04/php7.4) |
| proboci/ubuntu:18.04-php8.0  | [18.04-php8.0](https://github.com/ProboCI/docker-ubuntu/tree/master/18.04/php8.0) |
| proboci/ubuntu:20.04-php7.4-mysql5.7 | [20.04-php7.4-mysql5.7](https://github.com/ProboCI/docker-ubuntu/tree/master/20.04/php7.4-mysql5.7) |
| proboci/ubuntu:20.04-php7.4-mysql8.0 | [20.04-php7.4-mysql8.0](https://github.com/ProboCI/docker-ubuntu/tree/master/20.04/php7.4-mysql8.0) |
| proboci/ubuntu:20-04-php8.0-mysql5.7 | [20-04-php8.0-mysql5.7](https://github.com/ProboCI/docker-ubuntu/tree/master/20.04/php8.0-mysql5.7) |
| proboci/ubuntu:20-04-php8.0-mysql8.0 | [20-04-php8.0-mysql8.0](https://github.com/ProboCI/docker-ubuntu/tree/master/20.04/php8.0-mysql8.0) |
| proboci/ubuntu:20-04-php8.1-mysql5.7 | [20-04-php8.1-mysql5.7](https://github.com/ProboCI/docker-ubuntu/tree/master/20.04/php8.1-mysql5.7) |
| proboci/ubuntu:20-04-php8.1-mysql8.0 | [20-04-php8.1-mysql8.0](https://github.com/ProboCI/docker-ubuntu/tree/master/20.04/php8.1-mysql8.0) |

## Getting The Current Versions

You can get the current versions of all major components by using the SSH feature for the build in question and typing `versionizer` on the command line. This will give you the current, applicable versions for all major software pieces. Here is a sample from the PHP 7.4 Image running under Ubuntu 20:

```
Probo.CI - Software Versions Report:
------------------------------------
PHP 7.4.22 (cli) (built: Jul 30 2021 13:08:17) ( NTS )
Web Server version: Apache/2.4.41 (Ubuntu)
Google Chrome 92.0.4515.131 
ChromeDriver 92.0.4515.43
Kernel: 5.4.0-65-generic
Ubuntu 20.04.2 LTS
Composer version 2.1.5 2021-07-23 10:35:47
Drush Commandline Tool 9.7.3
Node: v12.22.4
WordPress CLI: WP-CLI 2.5.0
Pantheon Terminus 2.6.1
```
