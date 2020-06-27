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
}

###########################################
############  Change to Zsh  ##############

show "###### Install ZSH and change SHELL ######"

## install zsh
show "[Info] install make zsh"
echo $PASS | sudo -S apt-get update 
wait_apt_lock()
echo $PASS | sudo -S apt-get -y install make zsh
wait_apt_lock()

## change shell to zsh
show "[Info] chsh to zsh"
echo $PASS | chsh -s /bin/zsh 
wait 

## change new users default shell to zsh
show "\n\t[Info] change /etc/adduser.conf & /etc/default/useradd"
echo $PASS | sudo -S sed -i -- 's#DSHELL=/bin/sh#DSHELL=/bin/zsh#g' /etc/adduser.conf
echo $PASS | sudo -S sed -i -- 's#DSHELL=/bin/bash#DSHELL=/bin/zsh#g' /etc/adduser.conf
echo $PASS | sudo -S sed -i -- 's#DSHELL=/bin/sh#DSHELL=/bin/zsh#g' /etc/default/useradd
echo $PASS | sudo -S sed -i -- 's#DSHELL=/bin/bash#DSHELL=/bin/zsh#g' /etc/default/useradd
wait 

########################################################
#####################  Reboot  #########################
show ""
show "################################################
\t##                                            ##
\t##   [Info] Finish change shell to zsh        ##
\t##   [Info] Please Reboot !!                  ##
\t##            Thanks :)                       ##
\t##                                            ##
\t################################################\n"
wait 

