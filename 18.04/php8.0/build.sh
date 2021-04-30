#!/bin/bash

docker build . -t mbagnall/ubuntu:18.04-php8.0
docker build . -t proboci/ubuntu:18.04-php8.0
docker push mbagnall/ubuntu:18.04-php8.0
docker push proboci/ubuntu:18.04-php8.0