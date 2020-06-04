# My Ansible playbook

My machine configuration playbook

> Don't forget to to copy this repo to `~/Desktop/config`, else it's does not work

## To-Do

| No  | Name                             | Description                                                   | OS                      | Required |
| --- | -------------------------------- | ------------------------------------------------------------- | ----------------------- | -------- |
| 1   | Homebrew<br/>apt<br/>npm<br/>pip | - List all packages<br/>- Download only not existing packages | macOS<br/>Linux         | Yes      |
| 2   | Pacman                           | Add pacman support                                            | Arch Linux<br/>Manjaro  | No       |
| 3   | Windows 10                       | Add Windows support                                           | Windows 10 (LTSC, Home) | No       |
| 4   | Theming                          | Linux Desktop theming                                         | Ubuntu<br/>Manjaro      | Yes      |

## Steps

### Step 1

| OS           | Min. required version | Recommended version            |
| ------------ | --------------------- | ------------------------------ |
| macOS        | High Sierra (10.13.6) | Mojave (10.14.6) and higher    |
| Linux Ubuntu | 18.04                 | Focal Fossa (20.04) and higher |

---

| Name      | Command                                                         | System       | Required |
| --------- | --------------------------------------------------------------- | ------------ | -------- |
| Homebrew  | See [here](https://brew.sh)                                     | macOS, Linux | Yes      |
| Ansible   | `brew install ansible`                                          | macOS, Linux | Yes      |
| XCode CLI | `xcode-select --install`                                        | macOS        | Yes      |
| snap      | See [here](https://snapcraft.io/docs/installing-snap-on-ubuntu) | Linux        | Yes      |

> **Don't forget install all of these dependencies**

### Step 2

#### Arguments table

| Argument name | Default | Values          | Type   | Required |
| ------------- | ------- | --------------- | ------ | -------- |
| PASSWORD      | -       | -               | String | Yes      |
| MODE          | DESKTOP | DESKTOP, SERVER | String | No       |

- Open terminal
- Run `./run-ansible.sh $PASSWORD $MODE?`

### Step 3

Shell default change (if possible), guide [here for macOS](https://stackoverflow.com/a/26321141) or [here for Linux](https://superuser.com/a/119216)

### Step 4

> This steps for me to not forget

| No  | Application        | Tasks                                                                                             | Required |
| --- | ------------------ | ------------------------------------------------------------------------------------------------- | -------- |
| 1   | JetBrains apps     | - Sync Settings<br/> - Sync Plugins                                                               | Yes      |
| 2   | Sublime Text       | - Download Package Control<br/>- Download Sync Settings<br/>- Download sync configuration         | Yes      |
| 3   | Design-2-Code Apps | - Download from cloud Adobe Apps<br/>- Download purchased Sketch                                  | Yes      |
| 4   | Workdir            | - Download Open-source projects from Cloud<br/>- Copy other private workdirs from another machine | Yes      |

### Done. Enjoy

## Known Bugs / FAQ

### `/usr/local/bin` not writable

| Command | OS |
| `sudo chown -R $USER:root /usr/local/bin` | Ubuntu |
| `` sudo chown -R `whoami`:admin /usr/local/bin `` | macOS

Run command based on OS and problem should be fixed

### Please enter your SUDO password prompt

- Run `run-ansible.sh` with your Root user password, e.g. `sh run-ansible.sh 1234`

### Why Linux needs more rights

- I don't know why, but there no way bypass these requirements (at least i not able do that)
