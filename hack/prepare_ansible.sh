#!/bin/bash

echo "checking which package manager to use..."
if [ -n "$(sudo which yum)" ]
then
	echo "package manager of OS is yum, installing ansible with yum..."
	sudo yum install ansible unzip
elif [ -n "$(which apt)" ]
then
	echo "package manager of OS is apt, installing ansible with apt..."
	sudo apt-get update
	sudo apt-get install -y software-properties-common
	sudo apt-get install -y ansible unzip
else
	echo "could not determine the OS, installing ansible with python package manager pip..."
	sudo easy_install pip
	sudo pip install ansible
fi

