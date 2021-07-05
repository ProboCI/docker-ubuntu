#!/bin/bash

docker build . -t proboci/ubuntu:18.04-php8.0 --no-cache
docker push proboci/ubuntu:18.04-php8.0
