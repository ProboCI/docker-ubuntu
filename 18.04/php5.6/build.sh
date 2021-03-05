#!/bin/bash

docker build . -t proboci/ubuntu:18.04-php5.6 --squash
docker build . -t mbagnall/ubuntu:18.04-php5.6 --squash
docker push proboci/ubuntu:18.04-php5.6
docker push mbagnall/ubuntu:18.04-php5.6
