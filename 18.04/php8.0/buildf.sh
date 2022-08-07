#!/bin/bash

echo -n "Ubuntu 18.04 - PHP 8.0 ProboCI Build: "
docker build . -q -t docker.flyingflip.com/probo/ubuntu:18.04-php8.0
if [[ ${1} = 'production' ]] || [[ ${1} = 'prod' ]]; then
  echo -n "Pushing to FlyingFlip: "
  docker push -q docker.flyingflip.com/probo/ubuntu:18.04-php8.0
fi

echo ""
