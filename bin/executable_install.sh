#!/bin/bash

listbase="bemoji bitwarden bottom chezmoi fifm firefox flatpak grim grimshot-bin-sway github-cli hyfetch kdeconnect kid3 kitty light mpc mpd ncmpcpp neofetch nerd-fonts noto-fonts noto-fonts-emoji nushell pavucontrol sddm sddm slurp starship swaybg swayfx swayidle swaylock topgrade vim waybar wofi xorg-xwayland yt-dlp"
listfluff="ardour audacity cameractrls gimp inkscape kdenlive lutris piper steam"
config="$HOME/.config/"

read -p "Enter username: " user

# ensuring the rest of the system and the mirrors are up to date
yay -Syyu

# installing the base packages
yay -S $listbase

echo "Do you wish to install the floof? (graphic/gaming programs)"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) yay -S $listfluff; break;;
        No ) exit;;
    esac
done

# chezmoi
chezmoi init https://github.com/nemipune/dotfiles.git
chezmoi diff
chezmoi apply

# sddm setup
systemctl enable sddm.service
cp -rv $config/system/sddm/sddm.conf.d /etc
cp -rv $config/system/sddm/themes /usr/share/sddm
cp -rv $config/system/wayland-sessions /usr/share # this one passes the "--unsupported-gpu" flag to the sway command

# user config
usermod -aG audio,seat,users,video $user

# mpd setup
systemctl --user enable mpd.service
