#/!/bin/bash

echo "Backup up currently mackup config"
(mv ~/.mackup.cfg ~/.mackup.cfg.bak) || echo "Currently mackup config does not exist"

echo "Link necessary configs to home directory"
ln -s $(pwd)/dotfiles/.mackup.cfg ~/.mackup.cfg
ln -s $(pwd)/dotfiles/.gitconfig ~/.gitconfig

echo "Restore from mackup"
mackup restore

echo "Done. Thank you for using my script"
