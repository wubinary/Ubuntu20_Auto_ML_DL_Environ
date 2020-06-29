#!/bin/sh
USER=$USER
PASS=$1

LCYAN='\033[1;36m' # Light Cyan Color
RED='\033[0;31m' # RED Color
NC='\033[0m' # No Color

show(){
	echo "\t${LCYAN}$1${NC}"
	sleep 1
	wait 
}

wait_apt_lock(){
	while sudo fuser /var/{lib/{dpkg,apt/lists},cache/apt/archives}/lock >/dev/null 2>&1; do
		sleep 1
	done
	wait 
}

###########################################
######  copy .zshrc & .oh-my-zsh  #########
show "[Info] Copy .zshrc & .oh-my-zsh to /etc/skel"
if [ ! -f "/etc/skel/.zshrc" ]; then
	echo $PASS | sudo cp /home/$USER/.zshrc /etc/skel/
	echo $PASS | sudo cp -r /home/$USER/.oh-my-zsh /etc/skel
	wait 
else
	echo ".zshrc already in /etc/skel/"
fi 

###########################################
##########  copy .vimrc & .vim  ###########
show "[Info] Copy .vimrc $ .vim to /etc/skel/"
if [ ! -f "/etc/skel/.vimrc" ]; then
	echo $PASS | sudo cp /home/$USER/.vimrc /etc/skel/
	echo $PASS | sudo cp -r /home/$USER/.vim /etc/skel/
	wait 
else 
	echo ".vimrc already in /etc/skel/"
fi 

wait 

