# My Ansible playbook

My machine configuration playbook

> Don't forget to to copy this repo to `~/Desktop/config`, else it's does not work

## Install Homebrew

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`

## Run Ansible

`sh run-ansible.sh`

## Run mackup script

`mackup restore`

## Shell default change

See [here](https://stackoverflow.com/a/26321141) for more information.

- `sudo nano /etc/shells`
- Add `/usr/local/bin/fish`
- `chsh -s /usr/local/bin/fish`

## Steps:

1. Install Homebrew
2. Run Ansible
3. Run mackup script
4. Shell default change (if possible)

Done. Enjoy!
