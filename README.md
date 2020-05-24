# My Ansible playbook

My machine configuration playbook

> Don't forget to to copy this repo to `~/Desktop/config`, else it's does not work

## Machine coverage

This playbook covers almost 80% of my MacBook Pro state (like Time Machine copy), so this playbook currently tested, optimized and running only on macOS. Next steps

- Make fully macOS Configuration steps
- Linux support (apt/snap) and configurations

## Steps:

1.
  - Run `./run.sh $YOUR_PASSWORD` and then type password if you haven't installed Homebrew and Ansible
  - Run `./run-ansible.sh $YOUR_PASSWORD` if you have installed Homebrew and Ansible

2. Shell default change (if possible), guide [here](https://stackoverflow.com/a/26321141)

Done. Enjoy!
