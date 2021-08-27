#!/bin/bash

architecture=`arch`
if [ ${architecture} = 'arm64' ]; then
  echo "ARM64 Processor - Using buildx."
  docker buildx build --platform linux/amd64 -t proboci/ubuntu:20.04-php7.4-mysql8.0 --push .
else
  echo "x86_64 Processor - using build."
  docker build . -t proboci/ubuntu:20.04-php7.4-mysql8.0
  docker push proboci/ubuntu:20.04-php7.4-mysql8.0
fi
