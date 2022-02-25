#!/bin/bash

echo -n "Ubuntu 18.04 - PHP 8.0 ProboCI Build: "
architecture=`arch`
if [ ${architecture} = 'arm64' ]; then
  echo "ARM64 Processor - Using buildx."
  if [[ ${1} = 'production' ]] || [[ ${1} = 'prod' ]]; then
    docker buildx build --platform linux/amd64 -t proboci/ubuntu:18.04-php8.0 --push .
  else
    docker buildx build --platform linux/amd64 -t proboci/ubuntu:18.04-php8.0 .
  fi
else
  docker build . -q -t proboci/ubuntu:18.04-php8.0

  if [[ ${1} = 'production' ]] || [[ ${1} = 'prod' ]]; then
    echo -n "Pushing to DockerHub: "
    docker push -q proboci/ubuntu:18.04-php8.0
  fi
fi

echo ""
