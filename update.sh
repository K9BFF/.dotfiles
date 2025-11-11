#!/usr/bin/env bash

echo "dots updater"
echo

cp ~/.config/dunst/dunstrc dunst/
cp ~/.config/fish/config.fish fish/
cp ~/.config/hypr/hyprland.conf hypr/
cp ~/.config/kitty/kitty.conf kitty/
cp ~/.config/rofi/config.rasi rofi/
cp ~/.config/waybar/config waybar/
cp ~/.config/nvim/init.vim nvim/
sudo cp /etc/nixos/* nixos/

echo "updated. pushing to git..."
git add *
git commit -m "updated"
git push -u origin main
echo "done."
