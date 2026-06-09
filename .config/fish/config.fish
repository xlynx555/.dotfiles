if status is-interactive
    # Commands to run in interactive sessions can go here
    #source ~/.local/share/gh/extensions/gh-fish/gh-copilot-alias.fish
    starship init fish | source
    zoxide init fish | source
end
bind alt-backspace backward-kill-word
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias apts='apt search'
alias aptu='sudo apt update'
alias aptug='sudo apt upgrade'
alias apti='sudo apt install'

# lsd
alias ls='lsd --group-directories-first'
alias ll='lsd -la --group-directories-first'
alias la='lsd -A --group-directories-first'
alias lt='lsd --tree'

alias gksm='/usr/lib/jvm/jre1.8.0_202/bin/javaws $HOME/Documents/smclient.jnlp'
alias gksm-test='/usr/lib/jvm/jre1.8.0_202/bin/javaws $HOME/Documents/smclient_test.jnlp'
alias onelppsm-test='/usr/lib/jvm/jre1.8.0_202/bin/javaws http://sm-01-test.gk.jysk.netic.dk:8091/jnlp/smclient.jnlp'
alias onelppsm='/usr/lib/jvm/jre1.8.0_202/bin/javaws http://sm-01-prod.gk.jysk.netic.dk:8091/jnlp/smclient.jnlp'

alias vpnup='forticlient vpn connect JYSK -s -u dle'
alias vpndown='forticlient vpn disconnect'



#check if current terminal is kitty
if test "$KITTY_WINDOW_ID"
    alias ssh="kitten ssh"
end

export EDITOR='micro'
export VISUAL='micro'
export "MICRO_TRUECOLOR=1"
export KUBECONFIG=/home/dle/Downloads/config
export HOMEBREW_NO_REQUIRE_TAP_TRUST=1
set -gx PATH $PATH $HOME/.krew/bin
set -gx PATH $PATH $HOME/.local/bin

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv fish)"
