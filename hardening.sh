#!/bin/bash

GIT=$(dpkg -l | awk '/git/ {print }'| grep "fast, scalable" | wc -l)

if ! [ "$GIT" -ge 1 ]; then 
	
	apt-get -qq install git

fi

cd /usr/local/src

git clone https://github.com/SOC-MetabaseQ/hardening-ubuntu-bc.git

cd hardening-ubuntu-bc

bash ubuntu.sh
