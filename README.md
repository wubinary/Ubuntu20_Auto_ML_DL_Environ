# Ubuntu-20.04 Auto (pytorch) ML server 

# Ubuntu Auto ML Enviroment script


## How to run
### Full Install
- [x] zsh
- [x] vim (ycm)
- [x] nvidia-driver & cuda
- [x] python3 ml enviroment (torch keras tensorflow)
```=
sudo apt-get update
sudo apt-get install make git
git clone https://github.com/wubinary/Ubuntu_Auto_ML_Environ.git
cd Ubuntu_Auto_ML_Environ

# change shell
make change_shell PASSWD=[passwd]
[reboot]

# install nvidia-driver
make nvidia_driver PASSWD=[passwd]
[reboot]

# check if nvidia-smi works well
nvidia-smi

# install remains
make main PASSWD=[passwd]  

### finished, nice ball :) ###
``` 
### Light Install
- [ ] zsh
- [ ] vim (ycm)
- [x] nvidia-driver & cuda
- [x] python3 ml enviroment (torch keras tensorflow)
```cmd
sudo apt-get update && sudo apt-get install make git
git clone https://github.com/wubinary/Ubuntu_Auto_ML_Environ.git
cd ./Ubuntu_Auto_ML_Environ

# install nvidia-driver
make nvidia_driver PASSWD=[passwd]
[reboot]

# check if nvidia-smi works well
nvidia-smi

# install remains
make light PASSWD=[passwd]  

### finished, nice ball :) ###
```


## Features
1. zsh
2. vim ycm (c/c++ ; python)
3. nvidia-driver 440
4. cuda 10.2
5. system python3.8 & anaconda python3.7

## ZSH Plugins
* [oh-my-zsh](https://)
    with git tools
* [powerlevel9k](https://github.com/Powerlevel9k/powerlevel9k)
* [zsh-syntax-hightligh](https://github.com/zsh-users/zsh-syntax-highlighting)
    colorfy multiple commands.
* [zsh-autosugestions](https://github.com/zsh-users/zsh-autosuggestions)
    memory commands typed before and recommend command when you type.

![](https://i.imgur.com/CiznVLZ.png)


## Problem solvings
### install cuda: NO_PUBLICKEY F60F4B3D7FA2AF80
```=
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key F60F4B3D7FA2AF80
```

### vim mode can't past clipboard
```=
=> [shift] + right mouse click = paste
```


