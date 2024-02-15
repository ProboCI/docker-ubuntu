#!/bin/bash
validuser(){ [[ -n $(id -u "$1" 2>/dev/null) ]] && echo 1 || echo 0; }
validuser $1
