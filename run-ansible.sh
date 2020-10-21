#!/bin/bash

cd ansible
ansible-playbook -v --connection=local --become-user=$USER --extra-vars=$extra_vars site.yml
