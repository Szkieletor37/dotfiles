#!/usr/bin/env bash

# install build-essential
printf "Installing build-essential...\n"
sudo apt install -y build-essential

# install and setup zsh
printf "Installing zsh...\n"
sudo apt install -y zsh
sudo chsh $(whoami) -s $(which zsh)