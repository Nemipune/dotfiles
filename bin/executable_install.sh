#!usr/bin/env bash
set -e

# This assumes that you have EndeavourOS installed with yay

listbase="bemoji bitwarden bottom chezmoi fifm firefox flatpak grim grimshot-bin-sway github-cli hyfetch kdeconnect kid3 kitty light mpc mpd ncmpcpp neofetch nerd-fonts noto-fonts noto-fonts-emoji nushell pavucontrol sddm sddm slurp starship swaybg swayfx swayidle swaylock topgrade vim waybar wofi xorg-xwayland yt-dlp"

listfluff="ardour audacity cameractrls gimp guitarix inkscape kdenlive lmms lutris piper steam"

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

echo "Do you wish to install plasma alongside sway?"
select yn in "Yes" "No"; do
    case $yn in
	Yes ) yay -S plasma; break;;
	No ) exit;;
    esac
done

# flatpak
# note: the flatpak build for easyeffects is busted, see the sway config file for the workaround

flatpak install dev.vencord.Vesktop				# Vesktop
flatpak install com.github.wwmm.easyeffects			# Easyeffects
flatpak install im.riot.Riot					# Element

flatpak override dev.vencord.Vesktop --filesystem="/home/$user"	# Allow Vesktop to access files in /home/$user

# chezmoi
chezmoi init https://github.com/nemipune/dotfiles.git
chezmoi diff
chezmoi apply

# sddm setup
systemctl enable sddm.service
cp -rv "$config/system/sddm/sddm.conf.d" /etc
cp -rv "$config/system/sddm/themes" /usr/share/sddm
cp -rv "$config/system/wayland-sessions" /usr/share # this one passes the "--unsupported-gpu" flag to the sway command

# user config
usermod -aG audio,seat,users,video $user

# mpd setup
systemctl --user enable mpd.service

# wrap up update + vim settings
topgrade

# todo
# - setup the Icecast config when I do that
# - setup/config nushell and add it there
# - fix wlroots-nvidia blablabla
