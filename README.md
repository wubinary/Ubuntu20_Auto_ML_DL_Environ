# Ubuntu-20.04 Auto (pytorch) ML server 


## How to run
### Full Install
- [x] bag tools
- [x] zsh
- [x] vim (ycm)
- [x] nvidia-driver & cuda
- [x] python3 ml enviroment (torch keras tensorflow)
```cmd
# install git,make & clone repo
> sudo apt-get update && sudo apt-get install make git
> git clone https://github.com/wubinary/Ubuntu_Auto_ML_Environ.git
> cd Ubuntu_Auto_ML_Environ

# change shell
> make change_shell PASSWD=[passwd]
[reboot]

# install nvidia-driver
> make nvidia_driver PASSWD=[passwd]
[reboot]

# check if nvidia-smi works well
> nvidia-smi

# install remains
> make main PASSWD=[passwd]  

### finished, nice ball :) ###
``` 
### Light Install
- [x] bag tools
- [ ] zsh
- [ ] vim (ycm)
- [x] nvidia-driver & cuda
- [x] python3 ml enviroment (torch keras tensorflow)
```cmd
# install git,make & clone repo
> sudo apt-get update && sudo apt-get install make git
> git clone https://github.com/wubinary/Ubuntu_Auto_ML_Environ.git
> cd ./Ubuntu_Auto_ML_Environ

# install nvidia-driver
> make nvidia_driver PASSWD=[passwd]
[reboot]

# check if nvidia-smi works well
> nvidia-smi

# install remains
> make light PASSWD=[passwd]  

### finished, nice ball :) ###
```

# Features
1. bag tools
2. zsh
3. vim ycm (c/c++ ; python)
4. python env
    - nvidia-driver 440
    - cuda 10.2
    - system python3.8 & anaconda python3.7
## Bag tools
```
- tools
    - tmux 
    - htop
    - curl
    - net-tools
    - gcc/g++
    - apache2
    - openssh
- firewall
    - allow OpenSSH & Apache2
    - start ufw firewall
```

## ZSH Plugins
* [oh-my-zsh](https://)
    - with git tools
* [powerlevel9k](https://github.com/Powerlevel9k/powerlevel9k)
* [zsh-syntax-hightligh](https://github.com/zsh-users/zsh-syntax-highlighting)
    - colorfy multiple commands.
* [zsh-autosugestions](https://github.com/zsh-users/zsh-autosuggestions)
    - memory commands typed before and recommend command when you type.
    
![](https://i.imgur.com/CiznVLZ.png)

## VIM (YCM)
* [YCM (You Complete Me)](https://github.com/ycm-core/YouCompleteMe)

![](https://i.imgur.com/3eq2Nnu.gif)
python3 & c/c++ prompt word
![](https://i.imgur.com/A077MSN.gif)
c/c++: [ESC] auto grammar test


# Other auto install scripts
## Disk quota

# Problem shooting
### install cuda: NO_PUBLICKEY F60F4B3D7FA2AF80
```=
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key F60F4B3D7FA2AF80
```
### vim mode can't past clipboard
```=
=> [shift] + right mouse click = paste
```

