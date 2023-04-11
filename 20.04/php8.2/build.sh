#!/bin/bash

echo -n "Ubuntu 20.04 - PHP 8.2 ProboCI Build: "

docker build . -q -t proboci/ubuntu:20.04-php8.2 ${2}
if [[ ${1} = 'production' ]] || [[ ${1} = 'prod' ]]; then
  echo -n "Pushing to DockerHub: "
  docker push -q proboci/ubuntu:20.04-php8.2
fi

echo ""