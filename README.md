# Probo.CI Docker Ubuntu

This repository is used to store Ubuntu specific versions and configuration settings for building automated image builds on the Docker Hub.

Supported Ubuntu versions (14.04 LTS, 16.04 LTS and 18.04 LTS) are located in their respective version directory, `14.04`, `16.04` and `18.04`.

The Ubuntu Docker images and tags built from this repository are used as base images for other Probo.CI Docker images.

Note that varnish enabled containers are in the directories suffixed with -varnish such as `18.04-varnish`.

The Probo Ubuntu Docker images and tags built are located on the Docker Hub at: [https://hub.docker.com/u/proboci/ubuntu](https://hub.docker.com/u/proboci/ubuntu) and [https://hub.docker.com/r/mbagnall/ubuntu](https://hub.docker.com/r/mbagnall/ubuntu)
