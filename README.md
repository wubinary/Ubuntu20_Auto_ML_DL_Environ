# Ubuntu Auto ML Enviroment script



```command=
sudo apt-get update
sudo apt-get install make git

##change shell
make PASSWD=<xxx> change_shell
<reboot>

##install nvidia-driver
make PASSWD=<xxx> nvidia_driver
<reboot>
<check nvidia-smi>

##install remains
make PASSWD=<xxx> main 

## have fun :)

``` 


