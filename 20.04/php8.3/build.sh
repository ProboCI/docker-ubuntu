#!/bin/bash

echo "---------------------------------------------------------------"
echo "Ubuntu 20.04 - PHP 8.3 ProboCI Build: "
echo "---------------------------------------------------------------"
if [[ ${1} = 'production' ]] || [[ ${1} = 'prod' ]]; then
  echo "Building Production"
  echo "---------------------------------------------------------------"
  docker build . -q -t proboci/ubuntu:20.04-php8.3 ${2}
  echo "---------------------------------------------------------------"
  echo "Pushing to DockerHub: "
  docker push -q proboci/ubuntu:20.04-php8.3
  echo "---------------------------------------------------------------"
fi
if [[ ${1} = 'beta' ]]; then
  echo "Building Beta"
  echo "---------------------------------------------------------------"
  docker build . -q -t proboci/ubuntu:20.04-php8.3-beta ${2}
  echo "---------------------------------------------------------------"
  echo "Pushing *BETA* to DockerHub: "
  docker push -q proboci/ubuntu:20.04-php8.3-beta
  echo "---------------------------------------------------------------"
fi
