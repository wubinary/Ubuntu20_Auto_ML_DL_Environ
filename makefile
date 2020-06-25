PASSWD=xxxx

test: prettify_zsh

### change shell
change_shell:
	sh change_shell.sh $(PASSWD)

### main scripts
main: prepare prettify_zsh
prepare:
	sh prepare.sh $(PASSWD)
prettify_zsh:
	sh prettify_zsh.sh $(PASSWD)
prettify_vim:
	sh prettify_vim.sh $(PASSWD)	
	
