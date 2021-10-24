#!/usr/bin/env bash
set -e

echo "Reverting hosts..."
sudo rm -rf /etc/hosts
sudo ln $(pwd)/defaults.txt /etc/hosts
sudo chmod 0644 /etc/hosts
echo "Reverting hosts done..."
