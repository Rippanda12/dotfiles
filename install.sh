#!/bin/bash

# software & dependencies
sudo pacman -S git fish yay base-devel vulkan-devel wmname ranger firejail bat lsd fzf vlc  --noconfirm --needed && OK
sudo pacman -S nodejs npm gcc rust python-pip discord --noconfirm && OK
yay -S google-chrome spotify --noconfirm && OK


# changing shell
chsh -s $(which fish) && echo "Shell changed successfully ^_^"

# dotfiles
cd $HOME/dotfiles
sudo mkdir /etc/fan2go/
sudo cp $HOME/dotfiles/fan2go/fan2go.yaml /etc/fan2go/fan2go.yaml

sudo pacman -Syuu --noconfirm