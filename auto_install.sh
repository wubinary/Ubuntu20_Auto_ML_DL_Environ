PASS=abcd

LCYAN='\033[1;36m' # Light Cyan Color
RED='\033[0;31m' # RED Color
NC='\033[0m' # No Color

echo  -e "\n\t${LCYAN}[Info] Start Auto Install${NC}"

echo $PASS | sudo apt-get update
echo $PASS | sudo apt-get -y install openssh-server
echo  -e "\n\t${LCYAN}[Info] setting ubuntu ufw, enable ufw${NC}"
echo $PASS | sudo ufw app list 
echo $PASS | sudo ufw allow OpenSSH
echo $PASS | sudo ufw enable 

echo  -e "\n\t${LCYAN}[Info] install: tmux net-tools lm-sensors${NC}"
echo $PASS | sudo apt-get -y install tmux net-tools lm-sensors




