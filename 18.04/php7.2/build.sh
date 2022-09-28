#!/bin/bash

echo -n "Ubuntu 18.04 - PHP 7.2 ProboCI Build: "

docker build . -q -t proboci/ubuntu:18.04-php7.2 ${2}
if [[ ${1} = 'production' ]] || [[ ${1} = 'prod' ]]; then
  echo -n "Pushing to DockerHub: "
  docker push -q proboci/ubuntu:18.04-php7.2
fi

echo ""
