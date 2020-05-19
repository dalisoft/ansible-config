#!/bin/sh
cd ansible.mac
ansible-galaxy install -r requirements.yml
ansible-playbook --connection=local --inventory 127.0.0.1, site.yml
