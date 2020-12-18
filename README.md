# Ubuntu-20.04 Auto ML&DL server 💪

###### tags: `lab` `z-tech`
![](https://img.shields.io/static/v1?label=Ubuntu&message=20.04&color=purple)
![](https://img.shields.io/static/v1?label=python&message=3.7|3.8&color=blue)
![](https://img.shields.io/static/v1?label=pytorch&message=1.5&color=orange)
![](https://img.shields.io/static/v1?label=tensorflow&message=2.2.0&color=orange)
![](https://img.shields.io/static/v1?label=shell&message=zsh&color=green)
![](https://img.shields.io/static/v1?label=shell&message=vim&color=green)

### Intro
>This repo is for installing ML&DL enviroment for Ubuntu-20.04, with pytorch1.4.0 tensorflow2.2.0 keras, futhermore vim zshell usefull plugins are installed too.

## How to run 💡
### Full Install (ok to run)
- [x] bag tools
- [x] zsh
- [x] vim (ycm)
- [x] user skel copy
- [x] nvidia-driver & cuda
- [x] system python3.8 ml&dl enviroment (pytorch keras tensorflow)
- [x] anaconda python3.7 ml&dl enviroment (pytorch keras tensorflow)
```cmd
# install git,make & clone repo
> sudo apt-get update && sudo apt-get install make git
> git clone https://github.com/wubinary/Ubuntu20_Auto_ML_DL_Environ.git
> cd Ubuntu20_Auto_ML_DL_Environ

# change shell
> make change_shell PASSWD=[passwd]
[reboot]

# install nvidia-driver
> cd Ubuntu20_Auto_ML_DL_Environ
> make nvidia_driver PASSWD=[passwd]
[reboot]

# check if nvidia-smi works well
> nvidia-smi

# install remains
> cd Ubuntu20_Auto_ML_DL_Environ
> make full PASSWD=[passwd]  

### finished, nice ball :) ###
``` 
### ~~Light Install~~ (still some problem)
- [x] bag tools
- [ ] zsh
- [ ] vim (ycm)
- [ ] user skel copy
- [x] nvidia-driver & cuda
- [x] system python3.8 ml&dl enviroment (pytorch keras tensorflow)
- [x] anaconda python3.7 ml&dl enviroment (pytorch keras tensorflow)
```cmd
# install git,make & clone repo
> sudo apt-get update && sudo apt-get install make git
> git clone https://github.com/wubinary/Ubuntu20_Auto_ML_DL_Environ.git
> cd Ubuntu20_Auto_ML_DL_Environ

# install nvidia-driver
> make nvidia_driver PASSWD=[passwd]
[reboot]

# check if nvidia-smi works well
> nvidia-smi

# install remains
> make light PASSWD=[passwd]  

### finished, nice ball :) ###
```
---
# Features 😍 ⭐ 🥳 ⭐ 😁

### ZSH Plugins
* [oh-my-zsh](https://)
    - with git tools
* [powerlevel9k](https://github.com/Powerlevel9k/powerlevel9k)
* [zsh-syntax-hightligh](https://github.com/zsh-users/zsh-syntax-highlighting)
    - colorfy multiple commands.
* [zsh-autosugestions](https://github.com/zsh-users/zsh-autosuggestions)
    - memory commands typed before and recommend command when you type.
    
![](https://i.imgur.com/xMxqDAc.png)
![](https://i.imgur.com/WViNr2h.gif)

### VIM (YCM)
* [YCM (You Complete Me)](https://github.com/ycm-core/YouCompleteMe)

![](https://i.imgur.com/3eq2Nnu.gif)
python3 & c/c++ prompt word

![](https://i.imgur.com/A077MSN.gif)
c/c++: [ESC] auto grammar test

### Bag tools
```
- tools
    - tmux 
    - htop
    - curl
    - net-tools
    - docker.io
    - gcc/g++
    - apache2
    - openssh
- firewall
    - allow OpenSSH & Apache2
    - start ufw firewall
```

### Nvidia & Cuda
* nvidia-driver 440
* cuda 10.2
* system python3.8 & anaconda python3.7

### System python3.8 packages installed
[->See Installed packages](https://github.com/wubinary/Ubuntu20_Auto_ML_DL_Environ/tree/master/files/python3.8_system)

### Anaconda python3.7 packages installed
[->See Installed packages](https://github.com/wubinary/Ubuntu20_Auto_ML_DL_Environ/tree/master/files/python3.7_anaconda)

---
# ~~Additional auto install scripts 🥱 🎉~~
### ~~Disk quota~~

---
# Problem shooting 😨 😭 
### 1. powerline font on windows 8.10 not support perfect
![](https://i.imgur.com/WcaX5Ik.png)
>[[download dejavu font]](https://dejavu-fonts.github.io/Download.html)
>install DejaVuSans.ttf or DejaVuSansMono.ttf

### 2. powerline font on ubuntu18&20 not support perfect
![](https://i.imgur.com/MDl9ccE.png)
>Install the powerline font: [https://github.com/powerline/fonts](https://github.com/powerline/fonts)
>change font to "Ubuntu Mono derivative Powerline Regular"
>![](https://i.imgur.com/KsbvAmr.png)

### 3. install cuda: NO_PUBLICKEY F60F4B3D7FA2AF80
```=
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key F60F4B3D7FA2AF80
```

### 4. vim mode can't past clipboard
```=
=> [shift] + right mouse click = paste
```

### 5. where is my python3
1. system python3.8
![](https://i.imgur.com/V4KocVp.png)
2. anaconda python3.7 if activated
![](https://i.imgur.com/SSYvZ8K.png)

### 6. where is my pip & pip3
1. pip3 : system 
![](https://i.imgur.com/FrwFe90.png)
2. pip : anaconda
![](https://i.imgur.com/AyrHnuM.png)
