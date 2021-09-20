#!/bin/bash

architecture=`arch`
if [ ${architecture} = 'arm64' ]; then
  echo "ARM64 Processor - Using buildx."
  docker buildx build --platform linux/amd64 -t ubuntu:20.04-php8.1-mysql5.7 --push .
else
  echo "x86_64 Processor - using build."
  docker build . -t ubuntu:20.04-php8.1-mysql5.7
  docker push ubuntu:20.04-php8.1-mysql5.7
fi
