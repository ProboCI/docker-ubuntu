#!/bin/bash

echo "---------------------------------------------------------------"
echo "Ubuntu 20.04 - PHP 8.2 ProboCI Build: "
echo "---------------------------------------------------------------"

docker build . -t proboci/ubuntu:20.04-php8.2
if [[ ${1} = 'production' ]] || [[ ${1} = 'prod' ]]; then
  echo "---------------------------------------------------------------"
  echo "Pushing to DockerHub: "
  docker push proboci/ubuntu:20.04-php8.2
fi
echo "---------------------------------------------------------------"
