#!/usr/bin/env bash

# This script is mainly intended for my own personal use. This may not work out of the box for you!!

echo "updating dotfiles..."
echo

cp ~/.config/dunst/dunstrc ~/.dotfiles/dunst/
cp ~/.config/fish/config.fish ~/.dotfiles/fish/
cp ~/.config/hypr/hyprland.conf ~/.dotfiles/hypr/
cp ~/.config/kitty/kitty.conf ~/.dotfiles/kitty/
cp ~/.config/rofi/config.rasi ~/.dotfiles/rofi/
cp ~/.config/waybar/config ~/.dotfiles/waybar/
cp ~/.config/nvim/init.vim ~/.dotfiles/nvim/
sudo cp /etc/nixos/* ~/.dotfiles/nixos/

echo "updated locally. pushing to git..."
git add *
git commit -m "updated dotfiles"
git push -u origin main
echo "all done!"