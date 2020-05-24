#!/bin/sh
echo 'Asking XCode CLI...'
xcode-select --install

if brew --version > /dev/null; then
  echo 'Homebrew installed. OK'
else
  echo 'Homebrew not installed. Installing...'
  yes '' | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

if brew ls --versions ansible > /dev/null; then
  echo 'Ansible installed. OK'
else
  echo 'Ansible not installed. Installing...'
  brew install ansible
fi

sh run-ansible.sh $1

