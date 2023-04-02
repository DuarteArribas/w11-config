#!/bin/bash
echo "Setting initial configurations..."
echo "Copying files..."
sudo cp .gitconfig user/.bashrc $1
echo "Files successfully copied!"
echo "Installing default packages..."
sudo apt update && sudo apt upgrade
sudo apt install git-all
sudo apt install build-essential
sudo apt install net-tools
sudo apt install nasm
sudo apt install python3
sudo apt install python3-pip
sudo apt update && sudo apt upgrade
echo "Packages successfully installed!"