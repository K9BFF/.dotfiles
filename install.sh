#!/usr/bin/env bash

echo "dots installer"
echo
echo "congrats on the reinstall dumbass."
read -p "this is gonna overwrite all your configs btw is that ok? (y/N) " yesno
if [[ ${yesno:0:1} == "y" ]]; then
	cp dunst/ ~/.config/
	cp fish/ ~/.config/
	cp hypr/ ~/.config/
	cp kitty/ ~/.config/
	cp rofi/ ~/.config/
	cp waybar/ ~/.config/
	cp nvim/ ~/.config/
	sudo cp nixos/* /etc/nixos/
	echo "done."
else
	echo "no worries"
	exit 1
fi
