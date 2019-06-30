#!/bin/bash

echo "checking if ansible is installed..."

if [[ ! -n "$(sudo which ansible)" ]]
then
	if [[ -n "$(sudo which yum)" && ! -n "$(sudo which easy_install)" ]]
	then
		echo "package manager of OS is yum and easy_install is not installed, installing..."
		sudo yum install -y python-setuptools
		sudo easy_install pip
	elif [[ -n "$(which apt)" && ! -n "$(sudo which easy_install)" ]]
	then
		echo "package manager of OS is apt and easy_install is not installed, installing..."
		sudo apt update
		sudo apt install -y python-setuptools python-pip
	fi

	sudo pip install ansible
else
	echo "ansible is already installed, upgrading if newer version is available..."
	sudo pip install --upgrade ansible
	exit 0
fi
