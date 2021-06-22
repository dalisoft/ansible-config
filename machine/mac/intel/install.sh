#!/bin/bash
set -e

PASSWORD=$1
MODE=$2

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

function configure_askpass {
  rm -rf askpass.sh
  echo "#!/bin/sh" >>./askpass.sh
  echo "echo \"$PASSWORD\"" >>./askpass.sh
  chmod 700 askpass.sh
  export SUDO_ASKPASS=$(pwd)/askpass.sh
}

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

function check_and_prepare {
  check_env
  configure_askpass
  sudo_access_check
}

function installation {

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

  # Installing bundle
  cd $MODE
  brew bundle

  # Remove password by removing askpass
  rm -rf ../askpass.sh

  return 0
}

RETRIES=0
MAX_TRIES=5

# Run
check_and_prepare

while true; do
  if installation; then
    echo "Your apps installed successfully..."
    echo "Enjoy..."
    break
    exit 0
  else
    echo "Something got wrong..."
    echo "Retrying $RETRIES of $MAX_TRIES"
    RETRIES=$((RETRIES + 1))
    sleep 15
  fi
done
