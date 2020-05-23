#!/bin/sh
cd ansible.mac
ansible-galaxy install -r requirements.yml
ansible-playbook -v --connection=local --become-user=$USER --inventory 127.0.0.1, site.yml
