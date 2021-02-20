#!/bin/bash

docker build . -t proboci/ubuntu:18.04-php7.0 --squash
docker build . -t mbagnall/ubuntu:18.04-php7.0 --squash
docker push proboci/ubuntu:18.04-php7.0
docker push mbagnall/ubuntu:18.04-php7.0
