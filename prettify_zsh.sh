#!/bin/sh
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
#############  Default zsh  ###############
show "[Info] Install default zsh config"
if [ -f "/home/$USER/.zshrc" ]; then
	echo ".zshrc already existed"
	sleep 1
else
	rm -rf /home/$USER/.zsh_history
	rm -rf /home/$USER/.zshrc
	rm -rf /home/$USER/.oh-my-zsh/
	#wget https://raw.githubusercontent.com/wubinary/Ubuntu_Auto_ML_Environ/master/files/.zshrc?token=AGA7HSMUHJWCLN6EABO4MIS67U5QA -O /home/$USER/.zshrc
fi 

###########################################
##############  oh-my-zsh  ################
# oh-my-zsh
if [ ! -d "/home/$USER/.oh-my-zsh/" ]; then
	show "[Info] Install oh-my-zsh default config"
	rm -rf /home/$USER/.zshrc
	wget -O tempinstall.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh && echo "exit\n" | zsh tempinstall.sh
	rm -rf tempinstall.sh
	#echo "1\n" | zsh 
else
	echo "oh-my-zsh already installed"
fi

###########################################
#################  Theme  #################
show "[Info] Install zsh Theme"
if ! grep -q 'TERM="xterm-256color"' ~/.zshrc; then #上色東東
	sed -i '3iexport TERM="xterm-256color"\n' /home/$USER/.zshrc
fi 
# powerline字體, powerlevel主題, zsh-syntax-higtlight高亮度顯示
wait_apt_lock()
echo $PASS | sudo -S apt-get -y install powerline fonts-powerline zsh-theme-powerlevel9k zsh-syntax-highlighting
# 啟用主題
if ! grep -q "powerlevel9k.zsh-theme" ~/.zshrc; then #像mac
	echo "source /usr/share/powerlevel9k/powerlevel9k.zsh-theme" >> ~/.zshrc
fi 
if ! grep -q "zsh-syntax-highlighting.zsh" ~/.zshrc; then #幫cmd上色
	echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
fi
if ! grep -q 'ZSH_THEME="agnoster"' ~/.zshrc; then 
	sed -i -- 's/ZSH_THEME="robbyrussell"/#ZSH_THEME="robbyrussell"\nZSH_THEME="agnoster"/g' /home/$USER/.zshrc
fi 

###########################################
#############  Other plugins  #############
show "[Info] Install other zsh plugins"
# auto jump
echo $PASS | sudo -S apt-get -y install autojump
echo $PASS | sudo -S chmod +x /usr/share/autojump/autojump.sh
if ! grep -q "autojump.sh" ~/.zshrc; then
	echo "source /usr/share/autojump/autojump.sh" >> ~/.zshrc
fi
# auto suggestion
if [ ! -d "/home/$USER/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
	git clone git://github.com/zsh-users/zsh-autosuggestions /home/$USER/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi
if ! grep -q "zsh-autosuggestions.zsh" ~/.zshrc; then
	echo "source /home/$USER/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
fi 

###################
#### start zsh ####
zsh


