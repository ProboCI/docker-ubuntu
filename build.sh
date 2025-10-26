#!/bin/bash

cd ./22.04/php7.4/
./build.sh $1 $2

cd ../../22.04/php8.0/
./build.sh $1 $2

cd ../../22.04/php8.1/
./build.sh $1 $2

cd ../../22.04/php8.2/
./build.sh $1 $2

cd ../../22.04/php8.3/
./build.sh $1 $2

cd ../../22.04/php8.4/
./build.sh $1 $2

cd ../../22.04/php8.5/
./build.sh $1 $2

cd ../../
