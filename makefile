PASSWD=xxxx

test: prettify_zsh

### pre_environ
change_shell:
	sh script/change_shell.sh $(PASSWD)
nvidia_driver:
	sh script/nvidia_driver.sh $(PASSWD)

### main scripts
light: python3_env bag_tools 
full: python3_env remain_works zsh 

python3_env: cuda python3.8_sys python3.7_anaconda 
cuda:
	sh script/cuda.sh $(PASSWD)
python3.8_sys:	
	sh script/python3_sys/python3.8_sys.sh $(PASSWD)
python3.7_anaconda:
	zsh -i script/python3_anaconda/python3.7_anaconda.sh $(PASSWD) 

remain_works: bag_tools prettify_zsh prettify_vim user_skel 
bag_tools:
	sh script/bag_tools.sh $(PASSWD)
prettify_zsh:
	sh script/prettify_zsh.sh $(PASSWD)
prettify_vim:
	sh script/prettify_vim.sh $(PASSWD)	
user_skel:
	sh script/user_skel.sh $(PASSWD)
zsh:
	sh script/zsh.sh 

