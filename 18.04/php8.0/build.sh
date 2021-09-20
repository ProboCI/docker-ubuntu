#!/bin/bash

architecture=`arch`
if [ ${architecture} = 'arm64' ]; then
  echo "ARM64 Processor - Using buildx."
  if [[ ${1} = 'production' ]] || [[ ${1} = 'prod' ]]; then
    docker buildx build --platform linux/amd64 -t proboci/ubuntu:18.04-php8.0 --push .
  else
    docker buildx build --platform linux/amd64 -t proboci/ubuntu:18.04-php8.0 .
  fi
else
  echo "x86_64 Processor - using build."
  docker build . -t proboci/ubuntu:18.04-php8.0

  if [[ ${1} = 'production' ]] || [[ ${1} = 'prod' ]]; then
    docker push proboci/ubuntu:18.04-php8.0
  fi
fi
