function smb -a server_name
    # 1. Check if a server name was provided
    if test -z "$server_name"
        echo "Usage: mntd <server_name>"
        return 1
    end

    # 2. Define the source and target
    # Note: We use forward slashes for the mount command (standard for cifs)
    set -l smb_path "//$server_name/d\$"
    set -l target_mount "$HOME/mnt/$server_name"
    set -l creds_file "$HOME/.smbcredentials "

    # 3. Ensure the mount directory exists
    if not test -d $target_mount
        echo "Creating directory: $target_mount"
        mkdir -p $target_mount
    end

    # 4. Perform the mount
    # The 'd$' is escaped in the variable, but the shell needs to pass it literally
    echo "Attempting to mount $smb_path..."

    sudo mount -t cifs $smb_path $target_mount \
        -o credentials=$creds_file,uid=(id -u),gid=(id -g),iocharset=utf8,user

    # 5. Success check and open Dolphin
    if test $status -eq 0
        echo "Successfully mounted $server_name D-Drive to $target_mount"
        dolphin $target_mount &
        disown
    else
        echo "Mount failed. Ensure you have Admin rights on $server_name and check $creds_file"
    end
end
