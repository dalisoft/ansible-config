# My Ansible playbook

My machine configuration playbook

> Don't forget to to copy this repo to `~/Desktop/config`, else it's does not work

## Steps

### Step 1

| OS | Min. required version | Recommended version |
|-|-|-|
| macOS | High Sierra (10.13.6) | Mojave (10.14.6) and higher |
| Linux Ubuntu | 18.04 | Focal Fossa (20.04) and higher |

---

| Name | Command | System | Required |
|-|-|-|-|
|Homebrew| See [here](https://brew.sh) | macOS, Linux | Yes|
|Ansible| `brew install ansible` | macOS, Linux | Yes|
|XCode CLI| `xcode-select --install` | macOS | Yes|
|snap| See [here](https://snapcraft.io/docs/installing-snap-on-ubuntu) | Linux | Yes |

> **Don't forget install all of these dependencies**

### Step 2

#### Arguments table

| Argument name | Default | Type | Required |
|-|-|-|-|
| PASSWORD | - | String | Yes
| MODE | DESKTOP | String | No |

- Open terminal
- Run `./run-ansible.sh $PASSWORD $MODE?`

### Step 3

Shell default change (if possible), guide [here for macOS](https://stackoverflow.com/a/26321141) or [here for Linux](https://superuser.com/a/119216)

### Step 4

> This steps for me to don't forget

- Open all JetBrains app and Sync Settings & Plugins
- Open Sublime Text, download "Sync Settings", configure token and Download Cloud Settings

### Done. Enjoy

## Known Bugs / FAQ

### `/usr/local/bin` not writable

- on Linux: Run `sudo chown -R $USER:root /usr/local/bin` command and problem should be fixed
- on macOS: Run ```sudo chown -R `whoami`:admin /usr/local/bin``` command and problem should be fixed

### Please enter your SUDO password prompt

- Run `run-ansible.sh` with your Root user password, e.g. `sh run-ansible.sh 1234`

### Why Linux needs more rights

- I don't know why, but there no way bypass these requirements (at least i not able do that)
