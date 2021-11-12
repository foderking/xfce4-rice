#!/bin/bash

ubuntu="apt"
fedora="dnf"
arch="pacman"

SXHKD_DIR=$HOME/.config/sxhkd/
BSPWM_DIR=$HOME/.config/bspwm/
PICOM_DIR=$HOME/.config/picom/
GTK_XFCE_TERM=$HOME/.config/gtk-3.0/gtk.css

# Prefixes for installing on different distros
ubuntu_prefix=$ubuntu$" install xfce4"
fedora_prefix=$fedora$" install"
arch_prefix=$arch$" -S"

echo [=] XFCE4 config script with bspwm ricing
echo [+] Dependencies: xfce4, bspwm, sxhkd, picom
echo "    Make sure you have them installed before running the script"
echo [~] Optional installs: Virtualbox, visual studio code, kitty terminal, sublime, nemo


###
echo [+] Checking environments
###
# if [[ $(which $ubuntu) ]]
if  command -v $ubuntu &> /dev/null
then
	ENVI="ubuntu"

# elif [[ $(which $fedora) ]]
elif  command -v $fedora &> /dev/null
 then
	ENVI="fedora"

# elif [[ $(which $arch) ]]
elif  command -v $arch &> /dev/null
 then
	ENVI="arch"

else
	echo fail
	exit

fi

# export ENVI=$ENVI
echo [+] $ENVI detected

###
echo [+] Checking dependencies
###
if ! command -v bspwm &> /dev/null
then
	echo "bspwm isn't installed"
	exit
fi

if ! command -v sxhkd &> /dev/null
then
	echo "sxhkd isn't installed"
	exit
fi

if ! command -v picom &> /dev/null
then
	echo "picom isn't installed"
	echo Install from https://github.com/yshui/picom
	exit
fi

if ! command -v xfce4-session &> /dev/null
then
	echo "xfce isn't installed"
	exit
fi


###########
# Rice xfce terminal
###########
echo "[+] Copying gtk.css - for xfce4 terminal"
cat ./dotfiles/gtk.css >>  $GTK_XFCE_TERM
###########
# Rice bspwm
###########
echo "[+] Copying bspwmrc dotfile"
mkdir -p $BSPWM_DIR && cp dotfiles/bspwmrc $BSPWM_DIR/bspwmrc
###########
# Rice sxhkd
###########
echo "[+] Copying sxhkdrc dotfile"
mkdir -p $SXHKD_DIR && cp dotfiles/sxhkdrc $SXHKD_DIR/sxhkdrc
###########
# Rice picomc
###########
echo "[+] Copying sxhkdrc dotfile"
mkdir -p $PICOM_DIR && cp dotfiles/picom.conf $PICOM_DIR