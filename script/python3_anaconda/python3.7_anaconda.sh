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

#echo $PASS | sudo -S apt update 

#############################################
###############  Python3.7  #################

#show "###### Install python3-pip ######"
#echo $PASS | sudo -S apt-get -y install python3-pip
#wait_apt_lock()
show "[Info] Download Anaconda3 script"
wget https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh -q --show-progress -P ./files/anaconda/
wait 

show "[Info] Install Anaconda3"
zsh 
wait 

show "\t[Info] Install python3 base packages"
#pip3 install -r ./files/requirements_base.txt
wait 

show "\t[Info] Install python3 ml packages"
#pip3 install -r ./files/requirements_ml.txt
wait 

show "\t[Info] Install python3 torch family"
#pip3 install -r ./files/requirements_torch.txt
wait 

show "\t[Info] Install python3 tensorflow keras family"
#pip3 install -r ./files/requirements_tensorflow.txt
wait 

show "\t[Info] Install python3 others package"
#pip3 install -r ./files/requirements_others.txt
wait 







