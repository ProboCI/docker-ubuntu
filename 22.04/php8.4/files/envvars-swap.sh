#!/bin/bash

envsubst < "/envvars" > /etc/apache2/envvars
env | grep _ >> /etc/environment
source /etc/environment
