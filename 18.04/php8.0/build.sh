#!/bin/bash

docker build . -t proboci/ubuntu:18.04-php8.0
docker push proboci/ubuntu:18.04-php8.0
