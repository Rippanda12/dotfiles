#!/bin/bash
#chaotic aur
sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
#repo-local-mirror
sudo cp -v $HOME/dotfiles/etc/pacman.conf /etc/pacman.conf
sudo cp -v $HOME/dotfiles/etc/makepkg.conf /etc/makepkg.conf
sudo mkdir /repo
sudo mount /dev/sdb3 /repo
# software & dependencies
sudo pacman -Sy
sudo pacman -S git fish yay base-devel vulkan-devel wmname ranger vlc os-prober --noconfirm --needed && OK
sudo pacman -S nodejs npm gcc rust python-pip discord --noconfirm && OK
sudo pacman -S mesa mesa-demos mesa-vdpau lib32-mesa lib32-libva-mesa-driver --noconfirm --needed && OK
sudo pacman -S lib32-mea-demos lib32-mesa-vdpau lib32-opencl-mesa lib32-vulkan-mesa-layers --noconfirm --needed && OK
sudo pacman -S libva-mesa-driver opencl-mesa vulkan-mesa-layers lib32-vulkan-radeon vulkan-radeon --noconfirm --needed && OK
yay -S google-chrome surfshark-vpn flameshot spotify fan2go --noconfirm && OK


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
