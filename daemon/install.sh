#!/bin/bash

if [ $(id -u) -ne 0 ]; then
	printf "Script must be run as root. Try 'sudo ./install.sh'\n"
	exit 1
fi

if [ -d "/etc/plasma" ]; then
	printf "Directory /etc/plasma already exists, I'm not going to overwrite it!\n"
	exit
fi

printf "Installing requirements\n"
sudo pip install pypng plasmalights

printf "Installing plasma\n"
mkdir /etc/plasma
cp etc/plasma/* /etc/plasma
cp usr/bin/* /usr/bin/

printf "Installing /etc/systemd/system/plasma.service\n"
cp etc/systemd/system/plasma.service /etc/systemd/system/plasma.service
systemctl reenable plasma.service
systemctl start plasma.service
