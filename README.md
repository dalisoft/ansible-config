# My Ansible playbook

My machine configuration playbook

> Don't forget to to copy this repo to `~/Desktop/config`, else it's does not work

## To-Do

| No  | Name       | Description           | OS                      | Required |
| --- | ---------- | --------------------- | ----------------------- | -------- |
| 1   | Windows 10 | Add Windows support   | Windows 10 (LTSC, Home) | No       |
| 2   | Theming    | Linux Desktop theming | Ubuntu<br/>Manjaro      | Yes      |

## Steps

### Step 1

| OS            | Min. required version | Recommended version            |
| ------------- | --------------------- | ------------------------------ |
| macOS         | High Sierra (10.13.6) | Mojave (10.14.6) and higher    |
| Linux Ubuntu  | 18.04                 | Focal Fossa (20.04) and higher |
| Linux Manjaro | 19                    | 20 or Higher                   |

---

| Name      | Command                                                                                        | System               | Required |
| --------- | ---------------------------------------------------------------------------------------------- | -------------------- | -------- |
| Homebrew  | See [here](https://brew.sh)                                                                    | macOS, Debian/Ubuntu | Yes      |
| Ansible   | See [here](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) | macOS, Linux         | Yes      |
| XCode CLI | `xcode-select --install`                                                                       | macOS                | Yes      |
| snap      | See [here](https://snapcraft.io/docs/installing-snap-on-ubuntu)                                | Linux                | Yes      |

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

### Step 5 [Optional]

Installing macOS Style theme

| Type        | URL                                                                                                             | Name                    |
| ----------- | --------------------------------------------------------------------------------------------------------------- | ----------------------- |
| Gui / Shell | <https://github.com/vinceliuice/Mojave-gtk-theme>                                                               | Mojave-dark             |
| Cursor      | <https://github.com/keeferrourke/capitaine-cursors>                                                             | Capitaine-cursors-light |
| Icons       | <https://github.com/USBA/Cupertino-Catalina-iCons>                                                              | Cupertino-Catalina      |
| Walpaper    | [See here](https://wallpapershome.com/download-wallpapers/macos-catalina-day-mountains-wwdc-2019-5k-21590.html) | macOS Catalina          |

### Done. Enjoy

## Known Bugs / FAQ

> Some of these bugs/errors may happen only in first-run only, then works fine

### `/usr/local/bin` not writable

| Command                                           | OS    |
| ------------------------------------------------- | ----- |
| `sudo chown -R $USER:root /usr/local/bin`         | Linux |
| `` sudo chown -R `whoami`:admin /usr/local/bin `` | macOS |

Run command based on OS and problem should be fixed

### VSCodium extensions `.length` issue

See [here](https://github.com/VSCodium/vscodium/issues/430#issuecomment-646312604) to fix

### `Destination .../lsp does not exist`

Run `mkdir ~/lsp`

### Destination .../autoload does not exist`

- Go-to cloned folder
- `cd dotfiles`
- `cd .vim`
- `mkdir autoload`

### Please enter your SUDO password prompt

- Run `run-ansible.sh` with your Root user password, e.g. `sh run-ansible.sh 1234`

### Why Linux needs more rights

- I don't know why, but there no way bypass these requirements (at least i not able do that)
