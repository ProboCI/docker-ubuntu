#!/bin/bash

cd ./20.04/php7.4/
./build.sh $1 $2

cd ../../20.04/php8.0/
./build.sh $1 $2

cd ../../20.04/php8.1/
./build.sh $1 $2

cd ../../20.04/php8.2/
./build.sh $1 $2

cd ../../20.04/php8.3/
./build.sh $1 $2

cd ../../22.04/php7.4/
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

cd ../../24.04/php8.4/
./build.sh $1 $2

cd ../../
