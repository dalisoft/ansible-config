#!/bin/bash

extra_vars=''

if [ "$1" != "" ]
then
  extra_vars="{\"SUDO_PASS\":\"$1\",\"ansible_become_pass\":\"$1\",\"USER\":\"$USER\"}"
fi

cd ansible
ansible-galaxy install -r requirements.yml
ansible-playbook -v --connection=local --become-user=$USER --extra-vars=$extra_vars --inventory 127.0.0.1, site.yml
