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
#########  Install nv-drivers  ############

show "######################################"
show "######  Install Nvidia Drivers  ######"
show "https://www.tensorflow.org/install/gpu"
show ""

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/extras/CUPTI/lib64

#####################################
## Add NVIDIA package repositories ##
show "[Info] Add NVIDIA package repositories"

wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.1.243-1_amd64.deb

wait_apt_lock()
echo $PASS | sudo -S apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub

wait_apt_lock()
echo $PASS | sudo -S dpkg -i cuda-repo-ubuntu1804_10.1.243-1_amd64.deb

wait
echo $PASS | sudo -S apt-get update

wait 
wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb

wait_apt_lock()
echo $PASS | sudo -S apt -y install ./nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb

wait_apt_lock()
echo $PASS | sudo -S apt-get update


#####################################
####### Install NVIDIA driver #######
show "[Info] Install NV-driver" 

wait_apt_lock()
echo $PASS | sudo -S apt-get -y install --no-install-recommends nvidia-driver-430

#######################################################
#####################  Reboot  ########################
show "\t###############################################"
show "\t##	 										 ##"
show "\t##   [Info] Finish install nvidia-drivers    ##"
show "\t##	 [Info]	Please Reboot !! 	             ##"
show "\t##           Thanks :)                       ##"
show "\t##                                           ##"
show "\t###############################################"

