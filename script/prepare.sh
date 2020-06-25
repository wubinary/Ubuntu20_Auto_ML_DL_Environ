#!/bin/zsh
USER=$USER
PASS=$1

LCYAN='\033[1;36m' # Light Cyan Color
RED='\033[0;31m' # RED Color
NC='\033[0m' # No Color

show(){
	echo "\t${LCYAN}$1${NC}"
	sleep 1
}

wait_apt_lock(){
	while sudo fuser /var/{lib/{dpkg,apt/lists},cache/apt/archives}/lock >/dev/null 2>&1; do
		sleep 1
	done
}

###########################################
###############  Prepare  #################
#echo  -e "\n\t${LCYAN}[Info] ######## Start Auto Install ########\n${NC}"
show "###### Start Auto Install ######"
wait_apt_lock()
echo $PASS | sudo -S apt-get update
mkdir -p trash 

###########################################
################  套件們  #################
# 安裝 ssh 套件, 開啟防火牆
show "[Info] Install ssh-server & setting firewall"
wait_apt_lock()
echo $PASS | sudo -S apt-get -y install openssh-server
show "[Info] setting ubuntu ufw ; enable ufw"
echo $PASS | sudo -S ufw app list 
echo $PASS | sudo -S ufw allow OpenSSH
echo $PASS | sudo -S ufw enable 

# 安裝 tmux net-tools lm-sensors
show "[Info] Install tmux net-tools lm-sensors htop curl"
wait_apt_lock()
echo $PASS | sudo -S apt-get -y install tmux net-tools lm-sensors htop curl

# 安裝 gdrive
show "[Info] Install gdrive"
wait_apt_lock()
echo $PASS | sudo -S add-apt-repository ppa:alessandro-strada/ppa
echo $PASS | sudo -S apt-get -y install google-drive-ocamlfuse

# gcc g++
show "[Info] Install gcc g++"
wait_apt_lock()
echo $PASS | sudo -S apt-get -y install gcc g++

