#!/bin/bash

echo "---------------------------------------------------------------"
echo "Ubuntu 22.04 - PHP 8.5 ProboCI Build: "
echo "---------------------------------------------------------------"
docker build . -t proboci/ubuntu:22.04-php8.5 ${2}
if [[ ${1} = 'production' ]] || [[ ${1} = 'prod' ]]; then
  echo "---------------------------------------------------------------"
  echo "Pushing to DockerHub: "
  docker push proboci/ubuntu:22.04-php8.5
fi
echo "---------------------------------------------------------------"
