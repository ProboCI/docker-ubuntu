#!/bin/bash

docker build . -t proboci/ubuntu:18.04-php5.6
docker build . -t mbagnall/ubuntu:18.04-php5.6
docker push proboci/ubuntu:18.04-php5.6
docker push mbagnall/ubuntu:18.04-php5.6
