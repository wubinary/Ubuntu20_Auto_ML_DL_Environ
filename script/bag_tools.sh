#!/bin/zsh
HOST="$(cat /etc/hostname)"
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
###############  Prepare  #################
#echo  -e "\n\t${LCYAN}[Info] ######## Start Auto Install ########\n${NC}"
show "###### Start Auto Install ######"
echo $PASS | sudo -S apt-get update
wait_apt_lock()
mkdir -p trash 

###########################################
################  套件們  #################
# 安裝 ssh 套件, 開啟防火牆
show "[Info] Install ssh-server $ Apahce2 & setting firewall"
echo $PASS | sudo -S apt-get -y install openssh-server apache2
wait_apt_lock()
echo $PASS | sudo -S systemctl enable ssh 
echo $PASS | sudo -S systemctl enable apache2 
wait 
echo $PASS | sudo -S systemctl restart ssh
echo $PASS | sudo -S systemctl restart apache2 
wait 
show "[Info] setting ubuntu ufw ; enable ufw"
echo $PASS | sudo -S ufw app list 
echo $PASS | sudo -S ufw allow OpenSSH 
echo $PASS | sudo -S ufw allow Apache
wait 
echo $PASS | sudo -S ufw enable

# config ssh 歡迎資訊 motd.d
show "[Info] Config ssh welcome page, motd.d "
if [ ! -d "/etc/update-motd.d_default" ]; then
	echo $PASS | sudo -S cp -r /etc/update-motd.d /etc/update-motd.d_default
	wait
fi 
echo $PASS | sudo -S rm /etc/update-motd.d/*
wait 
echo $PASS | sudo -S cp ./files/00-header /etc/update-motd.d/00-header 
echo $PASS | sudo -S cp ./files/myMotd /etc/update-motd.d/myMotd
wait 
echo "$USER @ $HOST"
echo $PASS | sudo -S sed -i -- "s#hostname#$HOST#g" /etc/update-motd.d/myMotd 
echo $PASS | sudo -S sed -i -- "s#username#$USER#g" /etc/update-motd.d/myMotd 

# 安裝 motd.d 用到的套件 figlet boxes
show "[Info] Install motd.d used packages: figlet boxes"
echo $PASS | sudo -S apt-get -y install figlet boxes
wait_apt_lock()


# 安裝 tmux net-tools lm-sensors
show "[Info] Install tmux net-tools lm-sensors htop curl"
echo $PASS | sudo -S apt-get -y install tmux net-tools lm-sensors htop curl
wait_apt_lock()

# 安裝 gdrive
show "[Info] Install gdrive"
wait_apt_lock()
echo $PASS | sudo -S add-apt-repository ppa:alessandro-strada/ppa
wait 
echo $PASS | sudo -S apt-get -y install google-drive-ocamlfuse
wait

# gcc g++
show "[Info] Install gcc g++"
echo $PASS | sudo -S apt-get -y install gcc g++
wait_apt_lock()

show "[Info] finished bag tools "
show ""


