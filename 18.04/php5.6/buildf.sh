#!/bin/bash

echo -n "Ubuntu 18.04 - PHP 5.6 ProboCI Build: "

docker build . -q -t docker.flyingflip.com/probo/ubuntu:18.04-php5.6 ${2}
if [[ ${1} = 'production' ]] || [[ ${1} = 'prod' ]]; then
  echo -n "Pushing to FlyingFlip: "
  docker push -q docker.flyingflip.com/probo/ubuntu:18.04-php5.6
fi

echo ""
