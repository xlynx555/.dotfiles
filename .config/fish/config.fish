if status is-interactive
    # Commands to run in interactive sessions can go here
    source ~/.local/share/gh/extensions/gh-fish/gh-copilot-alias.fish
    starship init fish | source
    zoxide init fish | source
end
bind alt-backspace backward-kill-word
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
#check if current terminal is kitty
if test "$KITTY_WINDOW_ID"
    alias ssh="kitten ssh"
end
