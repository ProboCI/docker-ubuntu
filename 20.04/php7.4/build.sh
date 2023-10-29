#!/bin/bash

echo "---------------------------------------------------------------"
echo "Ubuntu 20.04 - PHP 7.4 ProboCI Build: "
echo "---------------------------------------------------------------"
docker build . -t proboci/ubuntu:20.04-php7.4
if [[ ${1} = 'production' ]] || [[ ${1} = 'prod' ]]; then
  echo "---------------------------------------------------------------"
  echo "Pushing to DockerHub: "
  docker push proboci/ubuntu:20.04-php7.4
fi
echo "---------------------------------------------------------------"
