#!/bin/bash
echo "Setting initial configurations..."
echo "Installing default packages..."
sudo apt -y update && sudo apt -y upgrade
sudo apt -y install git-all
sudo apt -y install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget
sudo apt -y install net-tools
sudo apt -y install nasm
sudo apt -y install python3
sudo apt -y install python3-pip
sudo apt -y install postgresql
sudo apt -y install openvpn
curl -y -sS https://starship.rs/install.sh | sh
sudo apt -y update && sudo apt upgrade
echo "Packages successfully installed!"
echo "Copying files..."
sudo cp .gitconfig .bashrc ~
sudo mkdir ~/.config
sudo cp starship.toml ~/.config
echo "Files successfully copied!"