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
show "[Info] Download Anaconda3 script"
#wget https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh -q --show-progress -P ./files/anaconda/
wait 

show "[Info] Install Anaconda3"
if [ ! -d /home/$USER/anaconda3 ]; then 
	bash ./files/anaconda/Anaconda3-2020.02-Linux-x86_64.sh -b
else
	echo "Anaconda3 already exist in /home/$USER/anaconda3"
	sleep 1
fi
wait 

show "[Info] add source to .zshrc & .bashrc "
if ! grep -q "anaconda3/bin/activate" ~/.zshrc; then 
	echo "\nsource /home/\$USER/anaconda3/bin/activate
conda deactivate
POWERLEVEL9K_ANACONDA_RIGHT_DELIMITER='>'
POWERLEVEL9K_ANACONDA_LEFT_DELIMITER='<'
POWERLEVEL9K_ANACONDA_BACKGROUND='24'
POWERLEVEL9K_ANACONDA_FOREGROUND='111'\n" >> ~/.zshrc
fi 
if ! grep -q "anaconda3/bin/activate" ~/.bashrc; then 
	echo "\nsource /home/\$USER/anaconda3/bin/activate
conda deactivate
POWERLEVEL9K_ANACONDA_RIGHT_DELIMITER='>'
POWERLEVEL9K_ANACONDA_LEFT_DELIMITER='<'
POWERLEVEL9K_ANACONDA_BACKGROUND='24'
POWERLEVEL9K_ANACONDA_FOREGROUND='111'\n" >> ~/.bashrc
fi 
wait 

show "[Info] Install python3 base packages"
#pip3 install -r ./files/requirements_base.txt
wait 

show "[Info] Install python3 ml packages"
#pip3 install -r ./files/requirements_ml.txt
wait 

show "[Info] Install python3 torch family"
#pip3 install -r ./files/requirements_torch.txt
wait 

show "[Info] Install python3 tensorflow keras family"
#pip3 install -r ./files/requirements_tensorflow.txt
wait 

show "[Info] Install python3 others package"
#pip3 install -r ./files/requirements_others.txt
wait 


##################
###### zsh #######
zsh 





