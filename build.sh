#!/bin/bash

cd ./18.04/php5.6
./build.sh

cd ../../18.04/php7.0
./build.sh

cd ../../18.04/php7.1/
./build.sh

cd ../../18.04/php7.2/
./build.sh

cd ../../18.04/php7.3/
./build.sh

cd ../../18.04/php7.4/
./build.sh

cd ../../18.04/php8.0/
./build.sh

cd ../../20.04/php7.4-mysql5.7/
./build.sh

cd ../../20.04/php7.4-mysql8.0/
./build.sh

cd ../../20.04/php8.0-mysql5.7/
./build.sh

cd ../../20.04/php8.0-mysql8.0/
./build.sh
