echo "Disabling service..."
systemctl --user mask tracker-store.service tracker-miner-fs.service tracker-miner-rss.service tracker-extract.service tracker-miner-apps.service tracker-writeback.service

echo "Resetting tracker..."
tracker reset --hard

echo "Done"
echo "Reboot your system to take effect"
