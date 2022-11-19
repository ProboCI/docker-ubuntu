#!/bin/bash

echo -n "Ubuntu 22.04 - PHP 8.2 ProboCI Build: "

docker build . -q -t docker.flyingflip.com/probo/ubuntu:22.04-php8.2 ${2}
if [[ ${1} = 'production' ]] || [[ ${1} = 'prod' ]]; then
  echo -n "Pushing to FlyingFlip: "
  docker push -q docker.flyingflip.com/probo/ubuntu:22.04-php8.2
fi

echo ""
