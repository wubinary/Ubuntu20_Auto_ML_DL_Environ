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
############  Change to Zsh  ##############

show "###### Install ZSH and change SHELL ######"

## install zsh
show "[Info] install make zsh"
wait_apt_lock()
echo $PASS | sudo -S apt-get update &&
echo $PASS | sudo -S apt-get install -y make zsh

## change shell to zsh
show "[Info] chsh to zsh"
wait_apt_lock()
chsh -s /bin/zsh 

## change new users default shell to zsh
show "[Info] change /etc/adduser.conf & /etc/default/useradd"
echo $PASS | sudo -S sed -i -- 's#DSHELL=/bin/sh#DSHELL=/bin/zsh#g' /etc/adduser.conf
echo $PASS | sudo -S sed -i -- 's#DSHELL=/bin/bash#DSHELL=/bin/zsh#g' /etc/adduser.conf
echo $PASS | sudo -S sed -i -- 's#DSHELL=/bin/sh#DSHELL=/bin/zsh#g' /etc/default/useradd
echo $PASS | sudo -S sed -i -- 's#DSHELL=/bin/bash#DSHELL=/bin/zsh#g' /etc/default/useradd

########################################################
#####################  Reboot  #########################
show "\t################################################"
show "\t##                                            ##"
show "\t##   [Info] Finish change shell to zsh        ##"
show "\t##   [Info] Please Reboot !!                  ##"
show "\t##            Thanks :)                       ##"
show "\t##                                            ##"
show "\t################################################"


