# If distro is Debian-based, copy Microsoft apt source and keyring files
if [ -f /etc/os-release ] && grep -qiE '(^ID=debian$|^ID_LIKE=.*debian)' /etc/os-release; then
  echo "Debian-based distro detected."

  SRC_DIR="$HOME/.config/etc/sources.list.d"
  SRC_SOURCES="$SRC_DIR/microsoft.sources"
  SRC_GPG="$SRC_DIR/microsoft.gpg"
  DEST_SOURCES="/etc/apt/sources.list.d/microsoft.sources"
  DEST_GPG="/usr/share/keyrings/microsoft.gpg"

  if [ -f "$SRC_SOURCES" ]; then
    if [ -f "$DEST_SOURCES" ] && cmp -s "$SRC_SOURCES" "$DEST_SOURCES"; then
      echo "Debian-based distro detected. microsoft.sources is already up to date."
    else
      echo "Debian-based distro detected. Copying microsoft.sources..."
      sudo cp "$SRC_SOURCES" "$DEST_SOURCES"
    fi
  else
    echo "Warning: $SRC_SOURCES not found; skipping."
  fi

  if [ -f "$SRC_GPG" ]; then
    if [ -f "$DEST_GPG" ] && cmp -s "$SRC_GPG" "$DEST_GPG"; then
      echo "microsoft.gpg is already up to date."
    else
      echo "Copying microsoft.gpg..."
      sudo cp "$SRC_GPG" "$DEST_GPG"
    fi
  else
    echo "Warning: $SRC_GPG not found; skipping."
  fi
  
  REQUIRED_PACKAGES=(build-essential procps curl file git flatpak kitty foot fonts-inter fonts-jetbrains-mono fonts-firacode gh zoxide)
  MISSING_PACKAGES=()

  for PKG in "${REQUIRED_PACKAGES[@]}"; do
    if ! dpkg -s "$PKG" >/dev/null 2>&1; then
      MISSING_PACKAGES+=("$PKG")
    fi
  done

  if [ ${#MISSING_PACKAGES[@]} -gt 0 ]; then
    echo "Installing missing packages: ${MISSING_PACKAGES[*]}"
    sudo apt-get update
    sudo apt-get install -y "${MISSING_PACKAGES[@]}"
  else
    echo "All required packages are already installed."
  fi

fi
# 1. If flatpak is installed, ensure flathub is configured as a source
if command -v flatpak >/dev/null 2>&1; then
  if flatpak remotes --columns=name | grep -qx "flathub"; then
    echo "Flatpak source flathub is already configured."
  else
    echo "Configuring default Flatpak source: flathub"
    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    flatpak update
  fi
else
  echo "Warning: flatpak command not available; skipping Flatpak source configuration."
fi
# 2. install starship prompt if not already installed
if ! command -v starship >/dev/null 2>&1; then
  echo "Installing starship prompt..."
  curl -fsSL https://starship.rs/install.sh | sh -s -- --bin-dir ~/.local/bin
else
  echo "Starship prompt is already installed."
fi
# 3. install homebrew if not already installed
if ! command -v brew >/dev/null 2>&1; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Add Homebrew to PATH for the current session
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  
else
  echo "Homebrew is already installed."
fi
# 4. using homebrew install yazi if not already installed
if ! command -v yazi >/dev/null 2>&1; then
  echo "Installing yazi with Homebrew..."
  brew install ffmpeg-full sevenzip jq poppler fd ripgrep fzf zoxide resvg imagemagick-full font-symbols-only-nerd-font
  brew link ffmpeg-full imagemagick-full -f --overwrite
  brew install yazi --HEAD
else
  echo "Yazi is already installed."
fi

# 5. install other tools with homebrew
brew install lazysql topgrade powershell

# 7. install bin (manage binary releases from Gihthub, Gitlab, Codeberg etc)
curl -fsSL https://github.com/marcosnils/bin/releases/download/v0.26.0/bin_0.26.0_linux_amd64 -o /tmp/bin_0.26.0_linux_amd64  && chmod +x /tmp/bin_0.26.0_linux_amd64 && /tmp/bin_0.26.0_linux_amd64 install github.com/marcosnils/bin && rm /tmp/bin_0.26.0_linux_amd64