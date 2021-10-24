# hosts

<p align='center'><b>The most largest anti-tracking, ad-blocking and security host database you can find around the world</b></p>

dalisoft's Hosts file with external sources which build final **hosts** file containing _almost_ **1 594 000** _unique entries_ and _almost_ **47 MiB** file-size

<p align='center'><a href='https://checkadblock.ru'>Check DNS ad-block</a></p>

## Caveats

Using this on macOS device may slow-down internet access, so i recommend using **NextDNS** [[Referral](https://nextdns.io/?from=9g576dsx)] link

## Features

- Most optimized and balanced
- **Privacy** sits locally
- Automatized
- Local generation, you own lists
- Crazy-tested database
- **Wildcard** white-list support

## Included lists

- [dalisoft's micro-host](./dalisoft.txt)
- [default hosts](./defaults.txt)
- [GoodbyeAds](https://github.com/jerryn70/GoodbyeAds)
- [StevenBlack's Hosts](https://github.com/StevenBlack/hosts)
- [AdAway's Hosts](https://github.com/AdAway/AdAway)
- [Mobile Hosts](https://github.com/r-a-y/mobile-hosts)
- [1Hosts **Pro**](https://github.com/badmojr/1Hosts)
- [Energized **Unified**](https://github.com/EnergizedProtection/block)

## Commands

### Your current host-file should be without any of ad-blocking hosts

| Name   | Command                                                               | OS          | Requires _sudo_? | Description                                        |
| ------ | --------------------------------------------------------------------- | ----------- | ---------------- | -------------------------------------------------- |
| Copy   | `cp /etc/hosts defaults.txt`                                          | macOS/Linux | No               | Copies your original hosts to current folder       |
| Build  | `python build.py`                                                     | All desktop | No               | Generates `hosts` from all available sources       |
| Link   | `sh link.sh`                                                          | macOS/Linux | Yes              | Links `hosts` to system                            |
| Revert | `sh revert.sh`                                                        | macOS/Linux | Yes              | Reverts `hosts` to system from `defaults.txt`      |
| Flush  | `sudo dscacheutil -flushcache;`<br/>`sudo killall -HUP mDNSResponder` | macOS       | Yes              | Clears DNS cache, flushs and reloads DNS responder |

## License

MIT-License
