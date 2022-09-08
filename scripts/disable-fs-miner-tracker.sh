echo "Disabling service..."
systemctl --user mask tracker-store.service tracker-miner-fs.service tracker-miner-rss.service tracker-extract.service tracker-miner-apps.service tracker-writeback.service

echo "Resetting tracker..."
tracker reset --hard

echo "Cleanup tracker..."
rm -rf ~/.cache/tracker
rm -rf ~/.local/share/tracker

echo "Done"
echo "Reboot your system to take effect"
