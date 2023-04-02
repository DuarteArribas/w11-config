#!/bin/bash
echo "Setting initial configurations..."
echo "Copying files..."
sudo cp .gitconfig user/.bashrc ~
echo "Files successfully copied!"
echo "Installing default packages..."
sudo apt update && sudo apt upgrade
sudo apt install git-all
sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget
sudo apt install net-tools
sudo apt install nasm
sudo apt install python3
sudo apt install python3-pip
sudo apt install postgresql
sudo apt install openvpn
sudo apt update && sudo apt upgrade
echo "Packages successfully installed!"