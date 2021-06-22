#!/bin/bash
set -e

#############################
### Environment variables ###
#############################
PASSWORD=$1
MODE=$2

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

#############################
### Packages installation ###
#############################

### Installing package manager
function install_package_manager {
  # XCode requirements
  if sudo -A xcode-select --version >>/dev/null; then
    echo "XCode already installed! Continue process..."
  else
    sudo -A xcode-select --install
  fi

  # Install Homebrew
  if brew --version >>/dev/null; then
    echo "Homebrew already installed! Continue process..."
  else
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash -
  fi
}
### Installing system packages
function install_system_packages {
  # Installing bundle
  cd $MODE
  brew bundle
}

### Installation npm packages
function install_npm_packages {
  echo "Installing npm packages..."
  npm install --global npm
  npm install --global \
    0x \
    bs-platform \
    cordova \
    esy \
    flamebearer \
    http-server \
    node-gyp \
    nodemon \
    npm-check-updates \
    typesync
}

### Installation pip packages
function install_pip_packages {
  echo "Installing pip packages..."
  python3 -m pip upgrade pip
  python3 -m pip install \
    virtualenv \
    jupyterlab \
    notebook \
    labelme \
    psrecord
}

### POST-installation
### steps for configure
function post_installation {
  nvim -c "PlugInstall" -c "qa"
}

#############################
### All installation step ###
#############################
function installation {
  install_package_manager
  install_system_packages

  ## Install npm and pip packages
  ## only on *compact* and *full*
  ## modes so all of these tools
  ## does not conflicts
  if ["$MODE" != "minimal"]; then
    install_npm_packages
    install_pip_packages
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
