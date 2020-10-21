#!/bin/bash

# Constants
extra_vars=''
args=''
os=${OSTYPE//[0-9.-]*/}

# Prepare data
if [ "$1" != "" ]; then
  extra_vars="{\"SUDO_PASS\":\"$1\",\"ansible_become_pass\":\"$1\",\"USER\":\"$USER\",\"HOME\":\"$HOME\"}"
fi
args="-v --connection=local --become-user=$USER --extra-vars='$extra_vars' -i=$PWD/hosts.ini"

# Installing requirements
run_playbook() {
  bash -c "ansible-galaxy install -r requirements.yml"
  bash -c "ansible-playbook $args $1/playbook.yml"
}

case "$os" in
# macOS / OS X
darwin)

  if [ "$2" == "SERVER" ]; then
    run_playbook "$PWD/server/os/mac"
  elif [ "$2" == "DESKTOP" ]; then
    run_playbook "$PWD/desktop/os/mac"
  else
    run_playbook "$PWD/common/os/mac"
  fi
  ;;

# Git Bash on Windows
msys)

  echo "Currently does not supports!"
  ;;

# Linux
linux)

  if [ "$2" == "SERVER" ]; then
    sh ./server/os/linux/run.sh "$args"
  elif [ "$2" == "DESKTOP" ]; then
    sh ./desktop/os/linux/run.sh "$args"
  else
    sh ./common/os/linux/run.sh "$args"
  fi
  ;;

# Unknown OS
*)

  echo "Unknown Operating system $OSTYPE"
  exit 1
  ;;

esac
