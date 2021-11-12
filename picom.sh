#!/bin/bash

echo $ENVI

if [[ $ENVI == "arch"]]; then
	if ! command -v yay &> /dev/null; then
		echo 'yay not installed. Install yay and run ./picom.sh again'
	else
		yay -S picom-ibhagwan-git
	fi

	exit

else
	# git clone --single-branch --branch next-rebase --depth=1 https://github.com/ibhagwan/picom
	# cd picom/
	if [[ $ENVI == "ubuntu"]]; then
		git clone --single-branch --branch next-rebase --depth=1 https://github.com/ibhagwan/picom
		cd picom/

	elif [[ $ENVI == "fedora"]]; then
		git clone --single-branch --branch next-rebase --depth=1 https://github.com/ibhagwan/picom
		cd picom/

fi