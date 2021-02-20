#!/bin/bash

docker build . -t proboci/ubuntu:18.04-php8.0 --squash
docker build . -t mbagnall/ubuntu:18.04-php8.0 --squash
docker push mbagnall/ubuntu:18.04-php8.0
docker push mbagnall/ubuntu:18.04-php8.0
