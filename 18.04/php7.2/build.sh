#!/bin/bash

docker build . -t proboci/ubuntu:18.04-php7.2
docker build . -t mbagnall/ubuntu:18.04-php7.2
docker push proboci/ubuntu:18.04-php7.2
docker push mbagnall/ubuntu:18.04-php7.2
