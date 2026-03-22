#!/bin/bash

# Define the repository and the local storage path
REPO_URL="https://github.com/xlynx555/.dotfiles.git"
CONFIG_DIR="$HOME/.cfg"

# 1. Clone the bare repository
if [ ! -d "$CONFIG_DIR" ]; then
    echo "Cloning bare repository..."
    git clone --bare "$REPO_URL" "$CONFIG_DIR"
fi

# 2. Define the alias for the current session
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME "$@"
}

# 3. Attempt to checkout
echo "Checking out config files..."
config checkout

# 4. Handle conflicts if the checkout fails
if [ $? = 0 ]; then
  echo "Checked out configurations successfully.";
else
  echo "Existing files detected. Backing up pre-existing configs to ~/.config-backup";
  mkdir -p $HOME/.config-backup
  
  # Identify the files that would be overwritten and move them
  config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} $HOME/.config-backup/{}
  
  # Retry the checkout
  config checkout
fi

# 5. Finalize configuration
config config --local status.showUntrackedFiles no

echo "Setup complete. Remember to add 'alias config=\"/usr/bin/git --git-dir=\$HOME/.cfg/ --work-tree=\$HOME\"' to your .bashrc or .zshrc."
