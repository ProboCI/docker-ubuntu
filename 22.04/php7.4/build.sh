#!/bin/bash

echo "---------------------------------------------------------------"
echo "Ubuntu 22.04 - PHP 7.4 ProboCI Build: "
echo "---------------------------------------------------------------"
docker build . -t proboci/ubuntu:22.04-php7.4 ${2}
if [[ ${1} = 'production' ]] || [[ ${1} = 'prod' ]]; then
  echo "---------------------------------------------------------------"
  echo -n "Pushing to DockerHub: "
  docker push proboci/ubuntu:22.04-php7.4
fi
echo "---------------------------------------------------------------"
