#!/bin/bash

UBUNTU_FILE="/etc/lsb-release"

#Existe archivo de ubuntu lsb-release?
if [ -f "$UBUNTU_FILE" ]; then

	#Ejecuto hardening Ubuntu

	#Git instalado??
	GIT=$(dpkg -l | awk '/git/ {print }'| grep "fast, scalable" | wc -l)

	if ! [ "$GIT" -ge 1 ]; then 
	
		apt-get -qq install git

	fi

	cd /usr/local/src
	git clone https://github.com/SOC-MetabaseQ/hardening-ubuntu-bc.git
	cd hardening-ubuntu-bc
	bash ubuntu.sh
else
	#Git instalado??
	GITRPM=$(yum -q list installed git &>/dev/null)
	ExitCode=$?

	if [ "$ExitCode" -ne 0 ]; then

	    yum install -y git

	fi

	#Ejecuto hardening centos
	cd /usr/local/src
    	git clone https://github.com/SOC-MetabaseQ/hardening-rpm.git
	cd hardening-rpm
	bash rpm_hardening.sh

fi
