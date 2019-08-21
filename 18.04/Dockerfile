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

LABEL name="Ubuntu 18.04 LTS Base ProboCI Image"
LABEL description="A base container of packages required for ProboCI Builds."
LABEL author="Jason Moore <jason@probo.ci>"
LABEL vendor="ProboCI, LLC."

WORKDIR /root

ENV TERM xterm

COPY files/startup.sh /startup.sh

# Update apt repos and install base apt packages.
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y apt-utils \
  apt-transport-https \
  build-essential \
  ca-certificates \
  curl \
  git \
  gnupg \
  libnss3 \
  libsqlite3-dev \
  lsb-release \
  nano \
  netcat-openbsd \
  nodejs \
  ntp \
  openjdk-8-jre \
  ruby-dev \
  sendmail \
  software-properties-common \
  sudo \
  vim \
  wget \
  zip

# Get Node Package Manager
RUN apt-get install -y npm

# Install NPM packages and setup Proboscis
RUN npm install -g proboscis --no-document \
  && ln -s /usr/lib/node_modules/proboscis/bin/proboscis /usr/bin/proboscis \
  && ln -s /usr/lib/node_modules/proboscis/bin/proboscis-control /usr/bin/proboscis-control \
  && ln -s /usr/lib/node_modules/proboscis/bin/proboscis-format /usr/bin/proboscis-format \
  && rm -rf /var/lib/apt/lists/* /tmp/*

# Install Gem packages.
RUN gem install mailcatcher --no-document

# Create .ssh dir and add SSH config file.
# TODO: There's got to be a better way to setup the /root/.ssh/config file. Using old method for now.
RUN mkdir /root/.ssh \
  && chmod 700 /root/.ssh \
  && touch /root/.ssh/config \
  && chmod 0700 /root/.ssh/config \
  && echo "Host *" >> /root/.ssh/config \
  && echo "StrictHostKeyChecking no" >> /root/.ssh/config
