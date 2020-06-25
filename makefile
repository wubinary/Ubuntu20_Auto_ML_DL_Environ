PASSWD=xxxx

test: prettify_zsh

### change shell
change_shell:
	sh script/change_shell.sh $(PASSWD)

### main scripts
main: prepare prettify_zsh prettify_vim
prepare:
	sh script/prepare.sh $(PASSWD)
prettify_zsh:
	sh script/prettify_zsh.sh $(PASSWD)
prettify_vim:
	sh script/prettify_vim.sh $(PASSWD)	
	
