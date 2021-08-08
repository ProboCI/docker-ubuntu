#!/bin/bash

docker build . -t proboci/ubuntu:18.04-php5.6
docker push proboci/ubuntu:18.04-php5.6
