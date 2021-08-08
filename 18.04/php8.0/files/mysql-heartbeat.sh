#!/bin/bash

OUTPUT="Can't connect"
while [[ $OUTPUT == *"Can't connect"* ]]
do
    OUTPUT=$(mysql -hlocalhost -uroot --password=strongpassword < ./my_script.sql 2>&1)
done