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

echo $PASS | sudo -S apt update 
wait_apt_lock()

#############################################
###############  Python3.8  #################
show "###### Install python3-pip ######"
echo $PASS | sudo -S apt-get -y install python3-pip
wait_apt_lock()

show "\t[Info] Install python3 base packages"
echo $PASS | sudo -H pip3 install -r ./files/python3.8_system/requirements_base.txt
wait 

show "\t[Info] Install python3 ml packages"
echo $PASS | sudo -H pip3 install -r ./files/python3.8_system/requirements_ml.txt
wait 

show "\t[Info] Install python3 torch family"
echo $PASS | sudo -H pip3 install -r ./files/python3.8_system/requirements_torch.txt
wait 

show "\t[Info] Install python3 tensorflow keras family"
echo $PASS | sudo -H pip3 install -r ./files/python3.8_system/requirements_tensorflow.txt
wait 

show "\t[Info] Install python3 others package"
echo $PASS | sudo -H pip3 install -r ./files/python3.8_system/requirements_others.txt
wait 


