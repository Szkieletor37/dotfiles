#!/usr/bin/env bash

info () {
    printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

success () {
    printf "\r  [ \033[00;32mOK\033[0m ] $1\n"

}

# install build-essential
info 'Installing build-essential...'
sudo apt install -y build-essential > /dev/null 2> /dev/null

success 'build-essential'

# install and setup zsh
info 'Installing and setup zsh...'
sudo apt install -y zsh > /dev/null 2> /dev/null
sudo chsh $(whoami) -s $(which zsh)

success 'zsh'

# setup git
info 'Setting up git...'
#git config --global user.name
#git config --global user.email