#!/bin/bash

architecture=`arch`
if [ ${architecture} = 'arm64' ]; then
  echo "ARM64 Processor - Using buildx."
  if [[ ${1} = 'production' ]] || [[ ${1} = 'prod' ]]; then
    docker buildx build --platform linux/amd64 -t proboci/ubuntu:18.04-php7.2-solr8 --push .
  else
    docker buildx build --platform linux/amd64 -t proboci/ubuntu:18.04-php7.2-solr8 .
  fi
else
  echo "x86_64 Processor - using build."
  docker build . -t proboci/ubuntu:18.04-php7.2-solr8

  if [[ ${1} = 'production' ]] || [[ ${1} = 'prod' ]]; then
    docker push proboci/ubuntu:18.04-php7.2-solr8
  fi
fi
