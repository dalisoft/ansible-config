#!/bin/bash
set -e

#############################
### Environment variables ###
#############################
PASSWORD=$1
MODE=$2
ARCH=$(uname -m)

##############################
### Installation variables ###
##############################
ENSURE_FOLDERS=(".config" ".config/fish" ".config/nvim" ".config/htop" ".npm-global" "Desktop/config/dotfiles/.vim/autoload")
LINK_FILES=(".vimrc" ".config/starship.toml")
LINK_FOLDERS=(".nano" ".vim" ".config/fish" ".config/nvim" ".config/htop")

NPM_PACKAGES=("npm" "0x" "bs-platform" "cordova" "esy" "flamebearer" "http-server" "node-gyp" "nodemon" "npm-check-updates" "typesync")
PIP_PACKAGES=("virtualenv" "jupyterlab" "notebook" "labelme" "psrecord")

FNM_VERSIONS=("12.22.1" "14.17.1")

#############################
### Preparations of steps ###
#############################

### Check and prompts ENV
### variables
function check_env {
  if [[ "$PASSWORD" == "" ]]; then
    echo "Hey, welcome! please trust me"
    echo "and enter valid password here"
    echo "I hope you understand me..."
    exit 1
  fi
  if [[ "$MODE" != "minimal" && $MODE != "compact" && $MODE != "full" ]]; then
    echo "Hey, welcome!"
    echo "Please select any of these values"
    echo "minimal, compact, full"
    exit 1
  fi
}
### Configre SUDO
### Askpass file
function configure_askpass {
  rm -rf askpass.sh
  echo "#!/bin/sh" >>./askpass.sh
  echo "echo \"$PASSWORD\"" >>./askpass.sh
  chmod 700 askpass.sh
}
### Configre ENV
### for future actions
function configure_env {
  export NPM_CONFIG_PREFIX="~/.npm-global"
  export SUDO_ASKPASS=$(pwd)/askpass.sh
  export PATH="$NPM_CONFIG_PREFIX/bin:/usr/local/bin:/opt/homebrew/bin:$PATH"
}
### Check for SUDO
### access check to
### validate
function sudo_access_check {
  if [[ "$EUID" = 0 ]]; then
    echo "Hey, welcome! I got (sudo) access"
    echo "Thank you for your trust, so"
    echo "i will continue my processes"
  else
    if sudo -A true; then
      echo "Hey, welcome! I got valid password"
      echo "Thank you for your trust, so"
      echo "i will continue my processes"
    else
      echo "Hey, how are you?"
      echo "Seems password is not valid"
      echo "Please check enter again..."
      echo "Thank you"
      rm -rf askpass.sh
      exit 1
    fi
  fi
}

#############################
### Run preparation steps ###
#############################
function check_and_prepare {
  check_env
  configure_askpass
  configure_env
  sudo_access_check
}

###################################
### Prepares linking and config ###
###################################
function pre_installation {
  echo "------"

  echo "Pre-installation steps..."

  ## Ensure these folders exists
  for ensure_folder in "${ENSURE_FOLDERS[@]}"; do
    mkdir -p "$HOME/$ensure_folder"
  done

  ## Link files
  for link_file in "${LINK_FILES[@]}"; do
    ln -h -f "$HOME/Desktop/config/dotfiles/$link_file" "$HOME/$link_file"
  done

  ## Link folders
  for link_folder in "${LINK_FOLDERS[@]}"; do
    ln -h -f -s "$HOME/Desktop/config/dotfiles/$link_folder" "$HOME/$link_folder"
  done
}

#############################
### Packages installation ###
#############################

### Installing package manager
function install_package_manager {
  echo "------"

  # XCode requirements
  if sudo -A xcode-select --version >>/dev/null; then
    echo "XCode is already installed! Continue process..."
  else
    sudo -A xcode-select --install
  fi

  # Rosetta installation for Apple Silicon
  # This is required to run x64/x86 apps
  if [[ "$ARCH" == "arm64" ]]; then
    if [[ ! -f "/Library/Apple/System/Library/LaunchDaemons/com.apple.oahd.plist" ]]; then
      sudo -A softwareupdate --install-rosetta --agree-to-license
    else
      echo "Rosetta is already installed. Continue process..."
    fi
  fi

  # Install Homebrew
  if brew --version >>/dev/null; then
    echo "Homebrew is already installed! Continue process..."
  else
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash -
  fi
}
### Installing system packages
function install_system_packages {
  echo "------"

  # Installing bundle
  cd $MODE
  brew bundle --force --no-lock
}

### Installation npm packages
function install_npm_packages {
  echo "------"

  echo "Installing npm packages..."

  INSTALLED_PACKAGES=$(npm list --global --depth=0 --json)
  for package in "${NPM_PACKAGES[@]}"; do
    if [[ $(echo "$INSTALLED_PACKAGES" | grep -o "\"$package\"") == "\"$package\"" ]]; then
      echo "Already installed npm package: $package"
    else
      npm install --global $package
    fi
  done
}

### Installation pip packages
function install_pip_packages {
  echo "------"

  echo "Installing pip packages..."

  INSTALLED_PACKAGES=$(pip list --format json)
  python3 -m pip install --upgrade pip
  for package in "${PIP_PACKAGES[@]}"; do
    if [[ $(echo "$INSTALLED_PACKAGES" | grep -o "\"$package\"") == "\"$package\"" ]]; then
      echo "Already installed pip package: $package"
    else
      python3 -m pip install $package
    fi
  done
}

## Installation Mac App Store apps
function install_mas_apps {
  echo "------"

  # iMovie
  mas install 408981434
  # Medis
  mas install 1063631769
  # Racompass
  mas install 1538380685
}

## Installation Node.js versions
function install_fnm_versions {
  echo "------"

  echo "Installing fnm versions..."

  INSTALLED_VERSION=$(fnm ls)
  for fnm_nvm in "${FNM_VERSIONS[@]}"; do
    if echo "$INSTALLED_VERSION" | grep "* v$fnm_nvm" >>/dev/null; then
      echo "Already installed fnm version: $fnm_nvm"
    else
      fnm install $fnm_nvm
    fi
  done
}

### POST-installation
### steps for configure
function post_installation {
  echo "------"

  echo "Pre-installation steps..."

  # neovim plugins installation
  nvim -c "PlugInstall" -c "qa"

  ### fish shell configuration
  FISH_SHELL_PATH=$(which fish)
  if cat /etc/shells | grep "$FISH_SHELL_PATH" >>/dev/null; then
    echo "Already set fish as list of shells"
  else
    echo $FISH_SHELL_PATH | sudo -A tee -a /etc/shells
  fi
  sudo -A chsh -s $FISH_SHELL_PATH       # change for root
  sudo -A chsh -s $FISH_SHELL_PATH $USER # change for current user
}

#############################
### All installation step ###
#############################
function installation {
  pre_installation

  install_package_manager
  install_system_packages

  ## Install npm and pip packages
  ## only on *compact* and *full*
  ## modes so all of these tools
  ## does not conflicts
  if [[ "$MODE" != "minimal" ]]; then
    install_npm_packages
    install_fnm_versions
    install_pip_packages
    install_mas_apps
  fi

  # Post-installation
  post_installation

  # Remove password by removing askpass
  rm -rf ../askpass.sh

  return 0
}

RETRIES=0
MAX_TRIES=5

### Run preparation
### steps once
check_and_prepare

#############################
### Retry validation step ###
#############################
while true; do
  ### Installation done
  if installation; then
    echo "Your apps installed successfully..."
    echo "Enjoy..."
    break
    exit 0
  ### Installation failed
  else
    echo "Something got wrong..."
    echo "Retrying $RETRIES of $MAX_TRIES"
    RETRIES=$((RETRIES + 1))
    sleep 15
  fi
done
