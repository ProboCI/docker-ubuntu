#!/bin/bash

echo -n "Ubuntu 22.04 - PHP 8.3 ProboCI Build: "

docker build . -q -t proboci/ubuntu:22.04-php8.3
if [[ ${1} = 'production' ]] || [[ ${1} = 'prod' ]]; then
  echo -n "Pushing to DockerHub: "
  docker push -q proboci/ubuntu:22.04-php8.3
fi

echo ""
