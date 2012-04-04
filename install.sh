#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

if [ "${DIR}" != "${HOME}/.vim" ]; then
	if [ -e "${HOME}/.vim" ]; then
		echo "Warning: a vim folder already exists. Old folder moved to vim_bak."
		mv ${HOME}/.vim ${HOME}/vim_bak
	fi
	echo "Creating symbolic link for .vim folder."
	ln -s ${DIR} ${HOME}/.vim
fi

if [ ! -L "${HOME}/.vimrc" ]; then
	if [ -e "${HOME}/.vimrc" ] ; then
		echo "Warning: a vimrc file already exists. Old file moved to vimrc.bak."
		mv ${HOME}/.vimrc ${HOME}/vimrc.bak 
	fi
	echo "Creating symbolic link for .vimrc file."
	ln -s ${DIR}/vimrc ${HOME}/.vimrc
fi

if [ ! -d "${HOME}/.vim/temp" ]; then
	echo "Creating temp folder."
	mkdir ${HOME}/.vim/temp
fi

if [ ! -d "${HOME}/.vim/undo" ]; then
	echo "Creating undo folder."
	mkdir ${HOME}/.vim/undo
fi

