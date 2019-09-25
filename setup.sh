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
	if [ ! -f /home/linuxbrew/.linuxbrew/bin/brew ]; then
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
		exit 0;
	fi
	chsh /home/linuxbrew/.linuxbrew/bin/zsh
	brew install zsh vim git python tmux
	;;
esac

if [ ! -d ~/.oh-my-zsh ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if [ ! -d ~/.cargo ]; then
    sh -c "$(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh)"
    sh -c "$(~/.cargo/bin/rustup component add rls rust-analysis rust-src)"
fi

dot_setup () {
	dotfile="$HOME/.$1"
	cp $1 $dotfile
}

dot_setup tmux.conf
dot_setup vimrc
dot_setup gvimrc
dot_setup zshrc
