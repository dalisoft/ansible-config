#!/bin/bash

extra_vars=''
install_mode='DESKTOP'

if [ "$2" == "SERVER" ]
then
  install_mode=$2
fi

if [ "$1" != "" ]
then
  extra_vars="{\"SUDO_PASS\":\"$1\",\"ansible_become_pass\":\"$1\",\"USER\":\"$USER\",\"HOME\":\"$HOME\",\"INSTALL_MODE\":\"$install_mode\"}"
fi

cd ansible
ansible-galaxy install -r requirements.yml
ansible-playbook -v --connection=local --become-user=$USER --extra-vars=$extra_vars --inventory 127.0.0.1, site.yml
