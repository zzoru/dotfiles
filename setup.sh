#!/bin/sh
OS=`uname`
case "$OS" in
Darwin)
	if [ ! -f /usr/local/bin/brew ]; then
		echo "First Install brew!";
		exit 0;
	else
		brew install zsh vim git python tmux
	fi
	;;
Linux)
	sudo apt-get install zsh vim git python gdb tmux curl
	#if [ ! -d ~/pwndbg ]; then
	#	git clone https://github.com/pwndbg/pwndbg ~/pwndbg
	#	sh ~/pwndbg/setup.sh
	#fi
	;;
esac

if [ ! -d ~/.oh-my-zsh ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

dot_setup () {
	dotfile="$HOME/.$1"
	cp $1 $dotfile
}

dot_setup tmux.conf
dot_setup vimrc
dot_setup gvimrc
dot_setup zshrc
