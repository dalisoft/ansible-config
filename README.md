# My Ansible playbook

My machine configuration playbook

> Don't forget to to copy this repo to `~/Desktop/config`, else it's does not work

## Machine coverage

This playbook covers almost 80% of my MacBook Pro state (like Time Machine copy), so this playbook currently tested, optimized and running only on macOS. Next steps

- Make fully macOS Configuration steps
- Linux support (apt/snap) and configurations

## Steps:

1. `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`. See [more](https://brew.sh)
2. Install Ansible (2.8 or 2.9)
2. Run Ansible via `sh run-ansible.sh`
3. Run mackup script via `mackup restore`
4. Shell default change (if possible), guide [here](https://stackoverflow.com/a/26321141)

Done. Enjoy!
