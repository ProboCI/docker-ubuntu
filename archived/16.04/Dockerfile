# Docker Image Builder v2
#
# These images are built using Dockerfile inheritance to build the images used for Probo.CI.
#
# Image: proboci/ubuntu
# Tag: 16.04
#
# Build the proboci/ubuntu:16.04 image:tag with the following command from inside the src/ubuntu/16.04 directory where the Dockerfile lives:
# docker build -t proboci/ubuntu:16.04

FROM ubuntu:16.04

WORKDIR /root

ENV NODE_VERSION 6.x

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  apt-transport-https \
  build-essential \
  ca-certificates \
  curl \
  git \
  libnss3 \
  lsb-release \
  nano \
  netcat-openbsd \
  ntp \
  python-software-properties \
  sendmail \
  software-properties-common \
  sudo \
  vim \
  wget \
  zip \
  && rm -rf /var/lib/apt/lists/* /tmp/*

RUN curl -sL https://deb.nodesource.com/setup_$NODE_VERSION | sudo -E bash - \
  && apt-get install -y nodejs \
  && npm install -g proboscis \
  && ln -s /usr/lib/node_modules/proboscis/bin/proboscis /usr/bin/penelope \
  && ln -s /usr/lib/node_modules/proboscis/bin/proboscis-control /usr/bin/penelope-control \
  && ln -s /usr/lib/node_modules/proboscis/bin/proboscis-format /usr/bin/penelope-format \
  && rm -rf /var/lib/apt/lists/* /tmp/*

RUN mkdir .ssh \
  && chmod 700 .ssh


