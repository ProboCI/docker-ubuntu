#!/bin/bash

envsubst < "/envvars" | sponge "/envvars"
