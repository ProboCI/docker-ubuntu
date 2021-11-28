#!/bin/bash

cd ./18.04/php5.6
./build.sh $1

cd ../../18.04/php7.0
./build.sh $1

cd ../../18.04/php7.1/
./build.sh $1

cd ../../18.04/php7.2/
./build.sh $1

cd ../../18.04/php7.3/
./build.sh $1

cd ../../18.04/php7.4/
./build.sh $1

cd ../../18.04/php8.0/
./build.sh $1

cd ../../20.04/php7.4/
./build.sh $1

cd ../../20.04/php8.0/
./build.sh $1

cd ../../20.04/php8.1/
./build.sh $1
