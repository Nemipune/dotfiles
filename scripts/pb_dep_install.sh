#!/bin/sh

yay -Syu
grep -v "#" /home/nemipune/scripts/ressources/pb-themes-deps | yay -S --needed - --noconfirm
