if status is-interactive
    # Commands to run in interactive sessions can go here
    #source ~/.local/share/gh/extensions/gh-fish/gh-copilot-alias.fish
    starship init fish | source
    zoxide init fish | source
end
bind alt-backspace backward-kill-word
alias reload-config-fish='. $HOME/.config/fish/config.fish'

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias apts='apt search'
alias aptu='sudo apt update'
alias aptug='sudo apt upgrade'
alias apti='sudo apt install'

alias mount-enactor='sudo mount.cifs //jump-enactor.jysk.local/E/ /home/dle/mnt/jump-enactor-e/ -o credentials=/home/dle/.smbcredentials-user,uid=dle -o x-systemd.device-timeout=2'

# lsd
# alias ls='lsd --group-directories-first'
# alias ll='lsd -la --group-directories-first'
# alias la='lsd -A --group-directories-first'
# alias lt='lsd --tree'

 # -- eza aliases --

 # basic listing
alias ls='eza' #test
alias l='eza -1'
alias la='eza -1a'
alias ll='eza -l'
alias lla='eza -la'
# filtered listing
alias ld='eza -D'
alias lld='eza -lD'
alias lf='eza -f'
alias llf='eza -lf'
# sort variant
alias lsz='eza -l --sort=size'
alias lsx='eza -l --sort=extension'
alias ltm='eza -l --sort=modified'
alias lcr='eza -l --sort=created'
# git-awar
alias lgit='eza -l --git'
alias lx='eza -lbhHigUmuS --git'
# tree (default depth 3
alias lt='eza --tree --level=3'
alias lta='eza -a --tree --level=3'
alias llt='eza -l --tree --level=3'
alias llta='eza -la --tree --level=3'

alias gksm='/usr/lib/jvm/jre1.8.0_202/bin/javaws $HOME/Documents/smclient.jnlp'
alias gksm-test='/usr/lib/jvm/jre1.8.0_202/bin/javaws $HOME/Documents/smclient_test.jnlp'
alias onelppsm-test='/usr/lib/jvm/jre1.8.0_202/bin/javaws http://sm-01-test.gk.jysk.netic.dk:8091/jnlp/smclient.jnlp'
alias onelppsm='/usr/lib/jvm/jre1.8.0_202/bin/javaws http://sm-01-prod.gk.jysk.netic.dk:8091/jnlp/smclient.jnlp'

alias vpnup='forticlient vpn connect JYSK -s -u dle'
alias vpndown='forticlient vpn disconnect'

alias vicinae-update='curl -fsSL https://vicinae.com/install | sudo bash'
alias edit-config-fish='micro $HOME/.config/fish/config.fish'
alias edit-config-kitty='micro $HOME/.config/kitty/kitty.conf'


#check if current terminal is kitty
#if test '$KITTY_WINDOW_ID'
#    alias ssh='kitten ssh'
#end

export EDITOR='micro'
export VISUAL='micro'
export 'MICRO_TRUECOLOR=1'
export SSH_AUTH_SOCK=$HOME/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock
# export SSH_AUTH_SOCK='/home/dle/.config/Keeper Password Manager/keeper-ssh-agent.sock'
export KUBECONFIG=$HOME/.kube/config
export HOMEBREW_NO_REQUIRE_TAP_TRUST=1
set -gx PATH $PATH $HOME/.krew/bin
set -gx PATH $PATH $HOME/.local/bin
set -gx PATH $PATH $HOME/.local/share/soar/bin


#test -f ~/.inshellisense/init/fish/init.fish && source ~/.inshellisense/init/fish/init.fish
