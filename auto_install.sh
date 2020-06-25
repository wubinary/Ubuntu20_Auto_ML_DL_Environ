USER=$USER
PASS="abcd"
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
###############    ZSH    #################
# oh-my-zsh
rm -rf /home/$USER/.zsh_history /home/$USER/.zshrc /home/$USER/.oh-my-zsh/
echo "1\n" | zsh 
show "[Info] prettify zsh"
if [ -d "/home/$USER/.oh-my-zsh" ] 
then
	echo "Directory /home/$USER/.oh-my-zsh/ exists."
	sleep 3 
else
	cd trash
	wait_apt_lock()
	wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
	cd ../
fi
# solarized, dir_colors
rm -rf /home/$USER/.solarized /home/$USER/.dir_colors  
if [ -d "/home/$USER/.solrized" ] 
then
	echo "Directory /home/$USER/.solarized/ exists." 
	sleep 3
else
	cd trash
	mkdir -p .solarized
	wait_apt_lock()
	git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git ./.solarized && 
	cd .solarized &&
	echo "1\n1\nyes\n1\n" | ./install.sh &&
	cd ../ &&
	mv ./.solarized ~/.solarized &&
	cd ../ && 
	sleep 10
fi


# 安裝 zsh-agnoster 需要的字體
wait_apt_lock()
echo $PASS | sudo -S apt-get -y install dconf-cli
wait_apt_lock()
echo $PASS | sudo -S apt-get -y install fonts-powerline
echo "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699"
if false #grep -Fxq "anoster_aa" /home/$USER/.zshrc
then
    # code if found
	echo "aaaa"
else
    # code if not found
	sed -i -- 's/ZSH_THEME="robbyrussell"/#ZSH_THEME="robbyrussell"\nZSH_THEME="agnoster"/g' /home/$USER/.zshrc
	#echo 'ZSH_THEME="agnoster"' >> /home/$USER/.zshrc
	#echo 'prompt_context() {
  	#	if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    #		prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  	#	fi
	#}' >> /home/$USER/.zshrc
	echo 'prompt_dir() {
		prompt_segment blue $PRIMARY_FG '%~ '
	}' >> /home/$USER/.zshrc
	#cat ./files/agnoster-zsh.theme >> /home/$USER/.zshrc
fi

# 安裝 ssh 套件, 開啟防火牆
wait_apt_lock()
echo $PASS | sudo -S apt-get -y install openssh-server
show "[Info] setting ubuntu ufw ; enable ufw"
echo $PASS | sudo -S ufw app list 
echo $PASS | sudo -S ufw allow OpenSSH
echo $PASS | sudo -S ufw enable 

show "[Info] install: tmux, net-tools, lm-sensors"
wait_apt_lock()
echo $PASS | sudo -S apt-get -y install tmux net-tools lm-sensors




