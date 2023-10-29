#!/bin/bash

echo "Backing up 18.04-php5.6"
docker save proboci/ubuntu:18.04-php5.6 > image-backups/18.04-php5.6-$(date +%Y-%m-%d).tar
gzip image-backups/18.04-php5.6-$(date +%Y-%m-%d).tar

echo "Backing up 18.04-php7.0"
docker save proboci/ubuntu:18.04-php7.0 > image-backups/18.04-php7.0-$(date +%Y-%m-%d).tar
gzip image-backups/18.04-php7.0-$(date +%Y-%m-%d).tar

echo "Backing up 18.04-php7.1"
docker save proboci/ubuntu:18.04-php7.1 > image-backups/18.04-php7.1-$(date +%Y-%m-%d).tar
gzip image-backups/18.04-php7.1-$(date +%Y-%m-%d).tar

echo "Backing up 18.04-php7.2"
docker save proboci/ubuntu:18.04-php7.2 > image-backups/18.04-php7.2-$(date +%Y-%m-%d).tar
gzip image-backups/18.04-php7.2-$(date +%Y-%m-%d).tar

echo "Backing up 18.04-php7.3"
docker save proboci/ubuntu:18.04-php7.3 > image-backups/18.04-php7.3-$(date +%Y-%m-%d).tar
gzip image-backups/18.04-php7.3-$(date +%Y-%m-%d).tar

echo "Backing up 18.04-php7.4"
docker save proboci/ubuntu:18.04-php7.4 > image-backups/18.04-php7.4-$(date +%Y-%m-%d).tar
gzip image-backups/18.04-php7.4-$(date +%Y-%m-%d).tar

echo "Backing up 18.04-php8.0"
docker save proboci/ubuntu:18.04-php8.0 > image-backups/18.04-php8.0-$(date +%Y-%m-%d).tar
gzip image-backups/18.04-php8.0-$(date +%Y-%m-%d).tar

echo "Backing up 18.04-php8.1"
docker save proboci/ubuntu:18.04-php8.1 > image-backups/18.04-php8.1-$(date +%Y-%m-%d).tar
gzip image-backups/18.04-php8.1-$(date +%Y-%m-%d).tar

echo "Backing up 20.04-php7.4"
docker save proboci/ubuntu:20.04-php7.4 > image-backups/20.04-php7.4-$(date +%Y-%m-%d).tar
gzip image-backups/20.04-php7.4-$(date +%Y-%m-%d).tar

echo "Backing up 20.04-php8.0"
docker save proboci/ubuntu:20.04-php8.0 > image-backups/20.04-php8.0-$(date +%Y-%m-%d).tar
gzip image-backups/20.04-php8.0-$(date +%Y-%m-%d).tar

echo "Backing up 20.04-php8.1"
docker save proboci/ubuntu:20.04-php8.1 > image-backups/20.04-php8.1-$(date +%Y-%m-%d).tar
gzip image-backups/20.04-php8.1-$(date +%Y-%m-%d).tar

echo "Backing up 20.04-php8.2"
docker save proboci/ubuntu:20.04-php8.2 > image-backups/20.04-php8.2-$(date +%Y-%m-%d).tar
gzip image-backups/20.04-php8.2-$(date +%Y-%m-%d).tar

echo "Backing up 22.04-php7.4"
docker save proboci/ubuntu:22.04-php7.4 > image-backups/22.04-php7.4-$(date +%Y-%m-%d).tar
gzip image-backups/22.04-php7.4-$(date +%Y-%m-%d).tar

echo "Backing up 22.04-php8.0"
docker save proboci/ubuntu:22.04-php8.0 > image-backups/22.04-php8.0-$(date +%Y-%m-%d).tar
gzip image-backups/22.04-php8.0-$(date +%Y-%m-%d).tar

echo "Backing up 22.04-php8.1"
docker save proboci/ubuntu:22.04-php8.1 > image-backups/22.04-php8.1-$(date +%Y-%m-%d).tar
gzip image-backups/22.04-php8.1-$(date +%Y-%m-%d).tar

echo "Backing up 22.04-php8.2"
docker save proboci/ubuntu:22.04-php8.2 > image-backups/22.04-php8.2-$(date +%Y-%m-%d).tar
gzip image-backups/22.04-php8.2-$(date +%Y-%m-%d).tar

echo "Backing up 22.04-php8.3"
docker save proboci/ubuntu:22.04-php8.3 > image-backups/22.04-php8.3-$(date +%Y-%m-%d).tar
gzip image-backups/22.04-php8.3-$(date +%Y-%m-%d).tar

echo "Backing up Alpine PHP 7.4"
docker save proboci/alpine:php7.4 > image-backups/alpine-php7.4-$(date +%Y-%m-%d).tar
gzip image-backups/alpine-php7.4-$(date +%Y-%m-%d).tar

echo "Backing up Alpine PHP 8.0"
docker save proboci/alpine:php8.0 > image-backups/alpine-php8.0-$(date +%Y-%m-%d).tar
gzip image-backups/alpine-php8.0-$(date +%Y-%m-%d).tar

echo "Backing up Alpine PHP 8.1"
docker save proboci/alpine:php8.1 > image-backups/alpine-php8.1-$(date +%Y-%m-%d).tar
gzip image-backups/alpine-php8.1-$(date +%Y-%m-%d).tar

echo "Backing up Alpine PHP 8.2"
docker save proboci/alpine:php8.2 > image-backups/alpine-php8.2-$(date +%Y-%m-%d).tar
gzip image-backups/alpine-php8.2-$(date +%Y-%m-%d).tar
