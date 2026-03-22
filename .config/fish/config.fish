if status is-interactive
    # Commands to run in interactive sessions can go here
    source ~/.local/share/gh/extensions/gh-fish/gh-copilot-alias.fish
    starship init fish | source
    zoxide init fish | source
end
bind alt-backspace backward-kill-word
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias config-sync='config add ~/.local/share/krusader/ ~/.local/share/kxmlgui5/ ~/.local/share/kwin/ ~/.local/share/krdc/ ~/.config/fish/ ~/.config/kitty/ ~/.config/powershell/ ~/.config/teams-for-linux/Preferences ~/.config/yazi/ ~/.config/btop/ ~/.config/alacritty/ ~/.config/zed/ ~/.config/mc/ ~/.config/gtk-3.0/ ~/.config/gtk-4.0/'
alias ssh="kitten ssh"
