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
	wait 
}

#echo $PASS | sudo -S apt update 

#############################################
###############  Python3.7  #################
show "[Info] Download Anaconda3 script"
if [ ! -p ./files/anaconda ]; then 
	mkdir -p ./files/anaconda
	wget https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh -q --show-progress -P ./files/anaconda/
fi
wait 

show "[Info] Install Anaconda3"
if [ ! -d /home/$USER/anaconda3 ]; then 
	bash ./files/anaconda/Anaconda3-2020.02-Linux-x86_64.sh -b
else
	echo "Anaconda3 already exist in /home/$USER/anaconda3"
	sleep 1
fi
wait

rm -rf ./files/anaconda/ 
rmdir ./files/anaconda/

##################################################
####  add source anaconda to zshrc & bashrc  ####
show "[Info] add source to .zshrc & .bashrc "
if ! grep -q "anaconda3/bin/activate" ~/.zshrc; then 
	echo "\nsource /home/\$USER/anaconda3/bin/activate
conda deactivate\n" >> ~/.zshrc
fi 
if ! grep -q "anaconda3/bin/activate" ~/.bashrc; then 
	echo "\nsource /home/\$USER/anaconda3/bin/activate
conda deactivate\n" >> ~/.bashrc
fi 
wait 

##############################
# let conda deativate tmp not avaliable at zshrc
sed -i -- "s/conda deactivate/#conda deactivate/g" ~/.zshrc 
sed -i -- "s/##conda deactivate/#conda deactivate/g" ~/.zshrc 

#sleep 30
wait 

#########################################
###  activate anaconda base
source /home/$USER/.zshrc 
wait
conda activate  
#conda init zsh 
wait 

show "[Info] Install python3 base packages"
pip install -r ./files/python3.7_anaconda/requirements_base.txt
wait 

show "[Info] Install python3 ml packages"
pip install -r ./files/python3.7_anaconda/requirements_ml.txt
wait 

show "[Info] Install python3 torch family"
pip install -r ./files/python3.7_anaconda/requirements_torch.txt
wait 

show "[Info] Install python3 tensorflow keras family"
pip install -r ./files/python3.7_anaconda/requirements_tensorflow.txt
wait 

show "[Info] Install python3 others package"
pip install -r ./files/python3.7_anaconda/requirements_others.txt
wait 

##############################
# let conda deativate at zshrc
sed -i -- "s/#conda deactivate/conda deactivate/g" ~/.zshrc 

##################
###### zsh #######
#zsh 
#conda activate 

wait 

