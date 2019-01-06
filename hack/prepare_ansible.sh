#!/bin/bash

echo "checking if ansible is installed..."

if [[ ! -n "$(sudo which ansible)" ]]
then
	if [[ -n "$(sudo which yum)" && ! -n "$(sudo which easy_install)" ]]
	then
		echo "package manager of OS is yum and easy_install is not installed, installing..."
		sudo yum install python-setuptools
	elif [[ -n "$(which apt)" && ! -n "$(sudo which easy_install)" ]]
	then
		echo "package manager of OS is apt and easy_install is not installed, installing..."
		sudo apt-get update
		sudo apt-get install python-setuptools
	fi

	sudo easy_install pip
	sudo pip install ansible
else
	echo "ansible is already installed, exiting..."
	exit 0
fi


