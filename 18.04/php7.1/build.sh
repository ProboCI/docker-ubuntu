#!/bin/bash

docker build . -t proboci/ubuntu:18.04-php7.1
docker push proboci/ubuntu:18.04-php7.1
