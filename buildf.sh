#!/bin/bash

cd ./20.04/php7.4/
./buildf.sh $1 $2

cd ../../20.04/php8.0/
./buildf.sh $1 $2

cd ../../20.04/php8.1/
./buildf.sh $1 $2

cd ../../22.04/php7.4/
./buildf.sh $1 $2

cd ../../22.04/php8.0/
./buildf.sh $1 $2

cd ../../22.04/php8.1/
./buildf.sh $1 $2

cd ../../22.04/php8.2/
./buildf.sh $1 $2
