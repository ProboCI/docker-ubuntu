# Probo.CI Docker Ubuntu

This repository is used to store the latest Ubuntu LTS (18.04, 20.04 and 22.04) installations and configuration settings. The Docker images built from this repository are developed specifically to be used as Docker images that run the build containers for [Probo.CI](https://probo.ci).  

Note that now that Ubuntu 18.04 is End of Life, it is no longer being updated as of June, 2023. It is kept for support purposes.  

The [proboci/ubuntu](https://hub.docker.com/u/proboci/ubuntu) Docker image [tree](https://hub.docker.com/r/proboci/ubuntu/tree/master) currently are built off of a corresponding Git branch in this repository as detailed below.  

| Docker Image Tag  | Git Directory |
| ------------- | ------------- |
| proboci/ubuntu:18.04-php5.6  | [18.04-php5.6](https://github.com/ProboCI/docker-ubuntu/tree/master/18.04/php5.6) |
| proboci/ubuntu:18.04-php7.0  | [18.04-php7.0](https://github.com/ProboCI/docker-ubuntu/tree/master/18.04/php7.0) |
| proboci/ubuntu:18.04-php7.1  | [18.04-php7.1](https://github.com/ProboCI/docker-ubuntu/tree/master/18.04/php7.1) |
| proboci/ubuntu:18.04-php7.2  | [18.04-php7.2](https://github.com/ProboCI/docker-ubuntu/tree/master/18.04/php7.2) |
| proboci/ubuntu:18.04-php7.3  | [18.04-php7.3](https://github.com/ProboCI/docker-ubuntu/tree/master/18.04/php7.3) |
| proboci/ubuntu:18.04-php7.4  | [18.04-php7.4](https://github.com/ProboCI/docker-ubuntu/tree/master/18.04/php7.4) |
| proboci/ubuntu:18.04-php8.0  | [18.04-php8.0](https://github.com/ProboCI/docker-ubuntu/tree/master/18.04/php8.0) |
| proboci/ubuntu:18.04-php8.1  | [18.04-php8.1](https://github.com/ProboCI/docker-ubuntu/tree/master/18.04/php8.1) |
| proboci/ubuntu:20.04-php7.4  | [20.04-php7.4](https://github.com/ProboCI/docker-ubuntu/tree/master/20.04/php7.4) |
| proboci/ubuntu:20.04-php8.0  | [20.04-php8.0](https://github.com/ProboCI/docker-ubuntu/tree/master/20.04/php8.0) |
| proboci/ubuntu:20.04-php8.1  | [20.04-php8.1](https://github.com/ProboCI/docker-ubuntu/tree/master/20.04/php8.1) |
| proboci/ubuntu:20.04-php8.2  | [20.04-php8.2](https://github.com/ProboCI/docker-ubuntu/tree/master/20.04/php8.2) |
| proboci/ubuntu:20.04-php8.3  | [20.04-php8.3](https://github.com/ProboCI/docker-ubuntu/tree/master/20.04/php8.3) |
| proboci/ubuntu:22.04-php7.4  | [22.04-php7.4](https://github.com/ProboCI/docker-ubuntu/tree/master/22.04/php7.4) |
| proboci/ubuntu:22.04-php8.0  | [22.04-php8.0](https://github.com/ProboCI/docker-ubuntu/tree/master/22.04/php8.0) |
| proboci/ubuntu:22.04-php8.1  | [22.04-php8.1](https://github.com/ProboCI/docker-ubuntu/tree/master/22.04/php8.1) |
| proboci/ubuntu:22.04-php8.2  | [22.04-php8.2](https://github.com/ProboCI/docker-ubuntu/tree/master/22.04/php8.2) |
| proboci/ubuntu:22.04-php8.3  | [22.04-php8.3](https://github.com/ProboCI/docker-ubuntu/tree/master/22.04/php8.3) |

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
Node: v12.22.4
WordPress CLI: WP-CLI 2.5.0
Pantheon Terminus 2.6.1
```
