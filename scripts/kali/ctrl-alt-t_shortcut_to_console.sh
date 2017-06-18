#!/bin/bash
echo "Make schortcut to gnome-terminal for Kali Linux"
echo
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name "'gnome-terminal'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/command "'gnome-terminal'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding "'<Primary><Alt>t'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
echo
echo "Now you can press 'CTRL+ALT+t(T)' to open new terminal window"

# I can't make this configs at "gsettings". If u can make this configs in "gsetting" pls write it
