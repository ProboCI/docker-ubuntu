#!/bin/bash

echo -n "Ubuntu 18.04 - PHP 8.0 ProboCI Build: "

docker build . -q -t proboci/ubuntu:18.04-php8.0 ${2}
if [[ ${1} = 'production' ]] || [[ ${1} = 'prod' ]]; then
  echo -n "Pushing to DockerHub: "
  docker push -q proboci/ubuntu:18.04-php8.0
fi

echo ""
