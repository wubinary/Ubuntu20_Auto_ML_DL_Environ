#!/bin/zsh
USER=$USER
PASS=$1

LCYAN='\033[1;36m' # Light Cyan Color
RED='\033[0;31m' # RED Color
NC='\033[0m' # No Color

show(){
	echo "\t${LCYAN}$1${NC}"
	sleep 1
	wait 
}

wait_apt_lock(){
	while sudo fuser /var/{lib/{dpkg,apt/lists},cache/apt/archives}/lock >/dev/null 2>&1; do
		sleep 1
	done
}

download_from_gdrive() {
	file_id=$1
	file_name=$2
			    
	# first stage to get the warning html
	curl -c /tmp/cookies \
	"https://drive.google.com/uc?export=download&id=$file_id" > \
	/tmp/intermezzo.html

	# second stage to extract the download link from html above
	download_link=$(cat /tmp/intermezzo.html | \
	grep -Po 'uc-download-link" [^>]* href="\K[^"]*' | \
	sed 's/\&amp;/\&/g')
	curl -L -b /tmp/cookies \
	"https://drive.google.com$download_link" > $file_name
}

###########################################
#############  Default vim  ###############
show "[Info] Install default vim config"
echo $PASS | sudo -S apt-get -y install vim 
wait_apt_lock()

###########################################
########  Download .vim/.vimrc  ###########
if [ ! -f "./vim.zip" ]; then
	#download_from_gdrive 10H_C4aS_gaMmTrzoKImpmYahvbDurqNw vim.zip
	wait
	#unzip -o vim.zip 
	wait 
	#mv -f .vim ~/ &&
	#mv -f .vimrc ~/
fi

if [ ! -d "/home/$USER/.vim/bundle/vundle" ]; then
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	wait 
fi

cat > ~/.vimrc <<EOL
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set bg=dark
set t_Co=256
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
"let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_server_python_interpreter='/usr/bin/python3'
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_max_num_candidates = 600 " 0 means no limit
let g:ycm_confirm_extra_conf = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_invoke_completion = ''
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_cache_omnifunc = 0
let g:syntastic_c_checkers = ['make']
let g:syntastic_always_populate_loc_list = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0

let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = 'X' 
let g:syntastic_warning_symbol = '⚠'

set completeopt-=preview
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'

" The following are examples of different formats supported.
" Keep Plugin commands between here and filetype plugin indent on.
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required

syntax on
set backspace=indent,eol,start

set mouse=a
set number

set shiftwidth=4 " 換行 跳4個空白

set tabstop=4
set backspace=2
set ai

set bg=dark

set fileencodings=utf8,big5,gbk,latin1
set fileencoding=utf8
set <C-u>=^U
set <C-b>=^B
map <C-u> :set fileencoding=utf8
map <C-b> :set fileencoding=big5

" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line
EOL

### Install bundle
show "[Info] VIM PluginInstalling , it will take 5min, please wait!!"
vim +PluginInstall +qall
wait
#echo ":PluginInstall" | vim 
#wait 

### Install YouCompleteMe
show "[Info] building YouCompleteMe "
echo $PASS | sudo git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
wait 
#echo $PASS | sudo git submodule update --init --recursive 
#wait
echo $PASS | sudo -S apt-get -y install build-essential cmake python3-dev
wait_apt_lock()

show "[Info] installing YouCompleteMe "
/home/$USER/.vim/bundle/YouCompleteMe/install.py --clang-completer 
#--system-libclang 
wait 

### copy .ycm_extra_conf
cp ./files/.ycm_extra_conf.py /home/$USER/.vim/bundle/YouCompleteMe/ 
wait 

### change c++ include file path of .ycm_extra_conf.py
show "[Info] changing .ycm_extra_conf.py c++ include path"
find /usr/include/c++ >> tmp.txt
wait 
result="$(grep '/profile/array' tmp.txt)"
result=$(echo $result | sed 's#/profile\/array##g' )
rm tmp.txt 
echo "$result"
sed -i "s#\/usr\/include\/c++\/xx#$result#g" /home/$USER/.vim/bundle/YouCompleteMe//.ycm_extra_conf.py 

wait 

show "[Info] finished install & config vim"


