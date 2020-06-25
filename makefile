PASSWD=xxxx

test: prettify_zsh

### pre_environ
change_shell:
	sh script/change_shell.sh $(PASSWD)
nvidia_driver:
	sh script/nvidia_driver.sh $(PASSWD)

### main scripts
main: install_cuda prepare prettify_zsh prettify_vim
install_cuda:
	sh script/install_cuda.sh $(PASSWD)
prepare:
	sh script/prepare.sh $(PASSWD)
prettify_zsh:
	sh script/prettify_zsh.sh $(PASSWD)
prettify_vim:
	sh script/prettify_vim.sh $(PASSWD)	
	
