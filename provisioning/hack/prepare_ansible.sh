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
		sudo apt update
		sudo apt install python-setuptools
	fi

	sudo easy_install pip
	sudo pip install ansible
else
	echo "ansible is already installed, upgrading if newer version is available..."
	sudo pip install --upgrade ansible
	if [[ $? == 0 ]]; then echo "successfully upgraded ansible with latest version" && exit 0; else echo "an error occured while upgrading ansible" && exit 255; fi
fi


