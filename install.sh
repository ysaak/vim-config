#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

if [[ "$DIR" != "${HOME}/${DIR##*/}" ]]; then
	echo "Error: your .vim folder must be in your home directory."
	exit 1
fi

if [[ "${DIR##*/}" != ".vim" ]]; then
	if [[ -e "${HOME}/.vim" ]]; then
		echo "Error: incorrect folder name and a .vim folder already exists in your home directory."
		exit 1
	fi
	echo "Updating folder name."
	mv ${DIR} ${DIR%/*}/.vim
fi

echo "Creating symbolic link."
ln -s ${HOME}/.vim/vimrc ${HOME}/.vimrc

