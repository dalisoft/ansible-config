# My Ansible playbook

My machine configuration playbook

> Don't forget to to copy this repo to `~/Desktop/ansible-config`, else it's does not work

## Steps

### Step 1

| OS            | Min. required version | Recommended version         | Link to script                                      |
| ------------- | --------------------- | --------------------------- | --------------------------------------------------- |
| macOS         | High Sierra (10.13.6) | Mojave (10.14.6) and higher | [Here](https://github.com/dalisoft/mac-config-bash) |
| Linux Ubuntu  | 18.04                 | 20.04 and higher            | This repo                                           |
| Linux PopOS   | 18.04                 | 19.04 and higher            | This repo                                           |
| Linux Manjaro | 18                    | 19 or Higher                | This repo                                           |
| Windows       | v1903                 | v2004                       | [Here](https://github.com/dalisoft/win-install)     |

---

| Name | Command                                                         | System | Required |
| ---- | --------------------------------------------------------------- | ------ | -------- |
| snap | See [here](https://snapcraft.io/docs/installing-snap-on-ubuntu) | Linux  | Yes      |

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

Shell default change (if possible) [here for Linux](https://superuser.com/a/119216)

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

## License

Apache-2.0 License
