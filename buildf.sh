#!/bin/bash

cd ./18.04/php5.6
./buildf.sh $1

cd ../../18.04/php7.0
./buildf.sh $1

cd ../../18.04/php7.1/
./buildf.sh $1

cd ../../18.04/php7.2/
./buildf.sh $1

cd ../../18.04/php7.3/
./buildf.sh $1

cd ../../18.04/php7.4/
./buildf.sh $1

cd ../../18.04/php8.0/
./buildf.sh $1

cd ../../18.04/php8.1/
./buildf.sh $1

cd ../../20.04/php7.4/
./buildf.sh $1

cd ../../20.04/php8.0/
./buildf.sh $1

cd ../../20.04/php8.1/
./buildf.sh $1

cd ../../22.04/php8.1/
./buildf.sh $1

cd ../../22.04/php8.0/
./buildf.sh $1

cd ../../22.04/php8.1/
./buildf.sh $1