#!/bin/bash

docker build . -t proboci/ubuntu:20.04-php8.1-mysql5.7
docker push proboci/ubuntu:20.04-php8.1-mysql5.7
