echo "Purging i386 architecture packages"
apt-get purge ".*:i386"

echo "Remove i386 architecture"
dpkg --remove-architecture i386

echo "Done"
