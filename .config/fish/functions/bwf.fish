function bwf
    set -l name (rbw list --fields name,user | fzf --prompt="Vault > ")
    
    if test -n "$name"
        rbw get "$name" | tr -d '\n' | fish_clipboard_copy
        echo "Copied: $name"
    end
end
