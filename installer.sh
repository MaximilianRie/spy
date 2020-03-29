#!/bin/bash

INSTALLPATH="$HOME/.local/bin/spy"
RED='\033[0;31m'
NC='\033[0m'

ask() {
	echo -e $1
	while true; do 
		read yn
		case $yn in
			[Yy]* ) return 0;;
			[Nn]* ) return 1;;
			* ) echo "Please answer with [Y/n].";;
		esac
	done
}

cancel() {
	echo "You canceled the installation process."
	exit 0
}

if [[ -f "$INSTALLPATH" ]]; then
	if ! ask "There is already a file at ~/.local/bin/spy. \
		Do you want to ${RED}override${NC} it? [Y/n]"; then 
		cancel
	fi
else 
	if ! ask "Do you want to ${RED}install${NC} spy in \
		~/.local/bin? [Y/n]"; then
		cancel
	fi
fi

curl -s "https://raw.githubusercontent.com/StealthyNiffler/spy/master/spy" \
	> "$INSTALLPATH"

chmod +x $INSTALLPATH

if ! [[ $PATH =~ .*~/\.local/bin.* ]]; then
	if ask "It seems like ~/.local/bin is not in your PATH. You \
		can add it manually of course.\nAlternatively you can \
		let this script add it automatically.\nDo you want this \
		script to ${RED}edit your ~/.bash_profile?${NC} [Y/n]"; then
		echo 'export PATH="$PATH:$HOME/.local/bin"' \
			>> "$HOME/.bash_profile"
		echo "Start a new shell session for the changes to take place"
	fi
fi
