#!/bin/bash

echo "---------------------------------------------------------------"
echo "Ubuntu 24.04 - PHP 8.3 ProboCI Build: "
echo "---------------------------------------------------------------"

docker build . -t proboci/ubuntu:24.04-php8.3
if [[ ${1} = 'production' ]] || [[ ${1} = 'prod' ]]; then
  echo "---------------------------------------------------------------"
  echo "Pushing to DockerHub: "
  docker push proboci/ubuntu:24.04-php8.3
fi
echo "---------------------------------------------------------------"
