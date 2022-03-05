#!/bin/bash

echo -n "Ubuntu 18.04 - PHP 7.3 ProboCI Build: "
architecture=`arch`
if [ ${architecture} = 'arm64' ]; then
  echo "ARM64 Processor - Using buildx."
  if [[ ${1} = 'production' ]] || [[ ${1} = 'prod' ]]; then
    docker buildx build --platform linux/amd64 -t proboci/ubuntu:18.04-php7.3 --push .
  else
    docker buildx build --platform linux/amd64 -t proboci/ubuntu:18.04-php7.3 .
  fi
else
  docker build . -q -t proboci/ubuntu:18.04-php7.3

  if [[ ${1} = 'production' ]] || [[ ${1} = 'prod' ]]; then
    echo -n "Pushing to DockerHub: "
    docker push -q proboci/ubuntu:18.04-php7.3
  fi
fi

echo ""
