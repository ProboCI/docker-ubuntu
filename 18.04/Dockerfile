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

FROM ubuntu:18.04

WORKDIR /root


RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y apt-utils \
	apt-transport-https \
	build-essential \
	ca-certificates \
	curl \
	git \
	libnss3 \
	lsb-release \
	nano \
	netcat-openbsd \
	nodejs \
	npm \
	ntp \
	sendmail \
	software-properties-common \
	sudo \
	vim \
	wget \
	zip \
  && rm -rf /var/lib/apt/lists/* /tmp/*

RUN npm install -g proboscis \
  && ln -s /usr/lib/node_modules/proboscis/bin/proboscis /usr/bin/penelope \
  && ln -s /usr/lib/node_modules/proboscis/bin/proboscis-control /usr/bin/penelope-control \
  && ln -s /usr/lib/node_modules/proboscis/bin/proboscis-format /usr/bin/penelope-format \
  && rm -rf /var/lib/apt/lists/* /tmp/*

RUN mkdir .ssh \
  && chmod 700 .ssh


