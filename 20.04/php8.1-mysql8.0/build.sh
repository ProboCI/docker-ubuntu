#!/bin/bash

docker build . -t proboci/ubuntu:20.04-php8.1-mysql8.0
docker push proboci/ubuntu:20.04-php8.1-mysql8.0
