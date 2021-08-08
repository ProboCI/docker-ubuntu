#!/bin/bash

docker build . -t proboci/ubuntu:20.04-php7.4-mysql8.0
docker push proboci/ubuntu:20.04-php7.4-mysql8.0
