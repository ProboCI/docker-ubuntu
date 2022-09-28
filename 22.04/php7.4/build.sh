#!/bin/bash

echo -n "Ubuntu 22.04 - PHP 7.4 ProboCI Build: "

docker build . -q -t proboci/ubuntu:22.04-php7.4 ${2}
if [[ ${1} = 'production' ]] || [[ ${1} = 'prod' ]]; then
  echo -n "Pushing to DockerHub: "
  docker push -q proboci/ubuntu:22.04-php7.4
fi

echo ""
