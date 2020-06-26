PASSWD=xxxx

test: prettify_zsh

### pre_environ
change_shell:
	sh script/change_shell.sh $(PASSWD)
nvidia_driver:
	sh script/nvidia_driver.sh $(PASSWD)

### main scripts
main: install_cuda python3_env prepare prettify_zsh prettify_vim
cuda:
	sh script/cuda.sh $(PASSWD)
python3_env:	
	sh script/python3.8_env.sh $(PASSWD)	
prepare:
	sh script/prepare.sh $(PASSWD)
prettify_zsh:
	sh script/prettify_zsh.sh $(PASSWD)
prettify_vim:
	sh script/prettify_vim.sh $(PASSWD)	


