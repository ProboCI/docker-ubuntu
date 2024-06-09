#!/bin/bash

echo "---------------------------------------------------------------"
echo "Ubuntu 24.04 - PHP 8.1 ProboCI Build: "
echo "---------------------------------------------------------------"

docker build . -t proboci/ubuntu:24.04-php8.1
if [[ ${1} = 'production' ]] || [[ ${1} = 'prod' ]]; then
  echo "---------------------------------------------------------------"
  echo "Pushing to DockerHub: "
  docker push proboci/ubuntu:24.04-php8.1
fi
echo "---------------------------------------------------------------"
