#!/bin/bash

echo "---------------------------------------------------------------"
echo "Ubuntu 24.04 - PHP 8.4 ProboCI Build: "
echo "---------------------------------------------------------------"
docker buildx build --platform linux/amd64,linux/arm64 -t proboci/ubuntu:24.04-php8.4 --push .
