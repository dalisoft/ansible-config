# My Ansible playbook

My machine configuration playbook

> Don't forget to to copy this repo to `~/Desktop/config`, else it's does not work

## Steps

### Step 1

| OS            | Min. required version | Recommended version         |
| ------------- | --------------------- | --------------------------- |
| macOS         | High Sierra (10.13.6) | Mojave (10.14.6) and higher |
| Linux Ubuntu  | 18.04                 | 20.04 and higher            |
| Linux PopOS   | 18.04                 | 19.04 and higher            |
| Linux Manjaro | 18                    | 19 or Higher                |
| Windows       | v1903                 | v2004                       |

---

| Name      | Command                                                                                        | System               | Required |
| --------- | ---------------------------------------------------------------------------------------------- | -------------------- | -------- |
| Homebrew  | See [here](https://brew.sh)                                                                    | macOS, Debian/Ubuntu | Yes      |
| Ansible   | See [here](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) | macOS, Linux         | Yes      |
| XCode CLI | `xcode-select --install`                                                                       | macOS                | Yes      |
| snap      | See [here](https://snapcraft.io/docs/installing-snap-on-ubuntu)                                | Linux                | Yes      |
| choco     | See [here](https://chocolatey.org/install)                                                     | Windows              | Yes      |

> **Don't forget install all of these dependencies**

### Step 2

For better and cleaner installation, please cleanup your architectures list. See [here](https://superuser.com/a/714392) or see `scripts` folder

See [**MISSING TABLE**](./ansible/MISSING.md)

#### Arguments table

| Argument name | Default | Values          | Type   | Required |
| ------------- | ------- | --------------- | ------ | -------- |
| PASSWORD      | -       | -               | String | Yes      |
| MODE          | DESKTOP | DESKTOP, SERVER | String | No       |

- Open terminal (Unix) or PowerShell (Windows)
- Run `./run-ansible.sh $PASSWORD $MODE?` (Linux) or `./install.ps1` (Windows)

### Step 3

Shell default change (if possible), guide [here for macOS](https://stackoverflow.com/a/26321141) or [here for Linux](https://superuser.com/a/119216)

### Step 4

> This steps for me to not forget

| No  | Application    | Tasks                                                                                             | Required |
| --- | -------------- | ------------------------------------------------------------------------------------------------- | -------- |
| 1   | JetBrains apps | - Sync Settings<br/> - Sync Plugins                                                               |
| 2   | Workdir        | - Download Open-source projects from Cloud<br/>- Copy other private workdirs from another machine | Yes      |

### Step 5 [Optional]

Installing macOS Style theme

See [here](https://github.com/vinceliuice/WhiteSur-gtk-theme#suggested-themes) for Shell, Firefox theme, Icons [2](https://github.com/vinceliuice/McMojave-circle) and Wallpaper [2](https://www.howtoisolve.com/download-macos-big-sur-wallpaper-hd-in-2020-4k-5k-wallpaper/)

For icons, see [here](https://github.com/keeferrourke/capitaine-cursors)

### Done. Enjoy
