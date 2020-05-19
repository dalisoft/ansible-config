# Etc files

## Hosts

### Check Ad and Tracker blocking level

See [here](https://checkadblock.ru)

### Copy your curreny hosts

> Your current host-file should be without any of ad-blocking hosts
> see `hosts.orig` example attached in repo

- `sudo cp /etc/hosts hosts.orig`

### Build hosts

`sh build.sh`

### Reload hosts

Try first variant, if it's doesn't work, try other

> works only for macOS

- `sudo dscacheutil -flushcache`
- `sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder`

### Link

> There hard-linked because of most of time soft-link does not work

`sudo ln -f hosts /etc/hosts`
