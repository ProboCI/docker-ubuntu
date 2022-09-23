#!/bin/bash

echo -n "Ubuntu 22.04 - PHP 7.4 ProboCI Build: "

docker build . -q -t docker.flyingflip.com/probo/ubuntu:22.04-php7.4
if [[ ${1} = 'production' ]] || [[ ${1} = 'prod' ]]; then
  echo -n "Pushing to FlyingFlip: "
  docker push -q docker.flyingflip.com/probo/ubuntu:22.04-php7.4
fi

echo ""