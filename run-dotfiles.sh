#/!/bin/bash

echo "Backup up currently mackup config"
(mv ~/.mackup.cfg ~/.mackup.cfg.bak) || echo "Currently mackup config does not exist"

echo "Copy current directory mackup config to home directory"
cp dotfiles/.mackup.cfg ~/.mackup.cfg

echo "Restore from mackup"
mackup restore

echo "Done. Thank you for using my script"
