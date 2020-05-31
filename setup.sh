#!/bin/sh
OS=`uname`
case "$OS" in
Darwin)
	if [ ! -f /usr/local/bin/brew ]; then
		echo "First Install brew!";
		exit 0;
	else
		brew install zsh vim git python tmux nodejs
	fi
	;;
Linux)
	sudo apt-get install build-essential curl file git
	if [ ! -f /home/linuxbrew/.linuxbrew/bin/brew ]; then
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
		eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
		brew install zsh vim git python tmux
		echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >>~/.zshrc
        sudo echo '/home/linuxbrew/.linuxbrew/bin/zsh' >> /etc/shells
		sudo chsh -s /home/linuxbrew/.linuxbrew/bin/zsh
	fi
	;;
esac

if [ ! -d ~/.oh-my-zsh ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

dot_setup () {
	dotfile="$HOME/.$1"
	cp $1 $dotfile
}

dot_setup tmux.conf
dot_setup vimrc
dot_setup gvimrc
dot_setup zshrc
