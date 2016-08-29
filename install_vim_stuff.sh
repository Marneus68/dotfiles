#!/bin/sh
git submodule init
git submodule update
cp .vimrc ~/
cp -rf .vim ~/

green=`tput setaf 2;tput bold`
reset=`tput sgr0`

echo ${green}Your vim install is ready! Enjoy!${reset}
