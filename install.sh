#!/usr/bin/env bash

# install build-essential
printf "Installing build-essential...\n"
sudo apt install -y build-essential

# install and setup zsh
printf "Installing zsh...\n"
sudo apt install -y zsh
chsh -s $(which zsh)
