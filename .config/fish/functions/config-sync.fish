function config-sync
    set -l config_paths \
        ~/.local/share/krusader/ \
        ~/.local/share/kxmlgui5/ \
        ~/.local/share/kwin/ \
        ~/.local/share/kate/ \
        ~/.local/share/krdc/ \
        ~/.config/fish/ \
        ~/.config/kitty/ \
        ~/.config/powershell/ \
        ~/.config/teams-for-linux/Preferences \
        ~/.config/yazi/ \
        ~/.config/btop/ \
        ~/.config/alacritty/ \
        ~/.config/zed/ \
        ~/.config/mc/ \
        ~/.config/gtk-3.0/ \
        ~/.config/gtk-4.0/ \
        ~/.config/xsettingsd/ \
        ~/.config/kate/
    config add $config_paths
    config commit -a -m "sync settings"
    config push
end
