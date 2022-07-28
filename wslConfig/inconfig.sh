#!/bin/bash
echo "Setting initial configurations..."
echo "Copying files..."
sudo cp .alias .gitconfig user/.bashrc $1
echo "Files successfully copied!"
echo "Installing default packages..."
sudo apt update && sudo apt upgrade
sudo apt install git-all
git config --global user.name $2
git config --global user.email $3
git config --global init.defaultBranch main
git config --global alias.lg "log --graph --abbrev-commit --decorate --pretty=format:'%C(bold blue)%h%C(reset) %C(bold green)(%cr)%C(reset) %C(cyan)%cn%C(reset)%C(bold red)%d%C(reset)%n%C(normal)%s%C(reset)'"
git config --global alias.a add
git config --global alias.c commit
git config --global alias.ca commit --amend
sudo apt install build-essential
sudo apt install net-tools
sudo apt install nasm
sudo apt install python3
sudo apt install python3-pip
sudo apt update && sudo apt upgrade
echo "Packages successfully installed!"