# My Ansible playbook

My machine configuration playbook

> Don't forget to to copy this repo to `~/Desktop/config`, else it's does not work

## Machine coverage

This playbook covers almost 80% of my MacBook Pro state (like Time Machine copy), so this playbook currently tested, optimized and running only on macOS. Next steps

- Make fully macOS Configuration steps

## Steps

### Step 1

| Name | Command | System | Required |
|-|-|-|-|
|Homebrew| See [here](https://brew.sh) | macOS, Linux | Yes|
|Ansible| `brew install ansible` | macOS, Linux | Yes|
|XCode CLI| `xcode-select --install` | macOS | Yes|
|snap| See [here](https://snapcraft.io/docs/installing-snap-on-ubuntu) | Linux | Yes |

> **Don't forget install all of these dependencies**

### Step 2

- Open terminal
- Run `./run-ansible.sh $YOUR_PASSWORD`

### Step 3

Shell default change (if possible), guide [here for macOS](https://stackoverflow.com/a/26321141) or [here for Linux](https://superuser.com/a/119216)

### Done. Enjoy
