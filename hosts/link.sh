#!/usr/bin/env bash
set -e

echo "Linking hosts..."
chmod 0644 hosts
sudo rm -rf /etc/hosts
sudo ln $(pwd)/hosts /etc/hosts
sudo chmod 0644 /etc/hosts
echo "Linking hosts done..."
