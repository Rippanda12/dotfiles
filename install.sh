#!/bin/bash
sudo cp $HOME/dotfiles/etc/pacman.conf /etc/pacman.conf
sudo cp $HOME/dotfiles/etc/makepkg.conf /etc/makepkg.conf
sudo mkdir /repo
sudo mount /dev/sdb3 /repo
# software & dependencies
sudo pacman -S git fish yay base-devel vulkan-devel wmname ranger vlc os-prober --noconfirm --needed && OK
sudo pacman -S nodejs npm gcc rust python-pip discord --noconfirm && OK
sudo pacman -S mesa mesa-demos mesa-vdpau lib32-mesa lib32-libva-mesa-driver --noconfirm --needed && OK
sudo pacman -S lib32-mea-demos lib32-mesa-vdpau lib32-opencl-mesa lib32-vulkan-mesa-layers --noconfirm --needed && OK
sudo pacman -S libva-mesa-driver opencl-mesa vulkan-mesa-layers lib32-vulkan-radeon vulkan-radeon --noconfirm --needed && OK
yay -S google-chrome surfshark-vpn flameshot spotify --noconfirm && OK


# changing shell
chsh -s $(which fish) && echo "Shell changed successfully ^_^"
#grub
sudo cp $HOME/dotfiles/etc/default/grub /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
echo "Grub config updated"



# dotfiles
cd $HOME/dotfiles
sudo mkdir /etc/fan2go/
sudo cp $HOME/dotfiles/fan2go/fan2go.yaml /etc/fan2go/fan2go.yaml
sudo systemctl enable --now fan2go

sudo pacman -Syuu --noconfirm
