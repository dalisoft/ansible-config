#/!/bin/bash

# Delete any hosts-tmp file
# if exists
echo 'Removing existing `hosts-tmp`...'
rm -rf hosts-tmp

# Create temporarily hosts file
echo 'Creating new `hosts-tmp`...'
touch hosts-tmp

# Add dalisoft-hosts to hosts-tmp
echo 'Adding `@dalisoft`s host to `hosts-tmp`...'
cat dalisoft-hosts >> hosts-tmp

# Add 2 x new line
echo "\n\n" >> hosts-tmp

# Add StevenBlack hosts to hosts-tmp
echo 'Adding `StevenBlack`s hosts to hosts-tmp...'
curl https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts >> hosts-tmp

# Add 2 x new line
echo "\n\n" >> hosts-tmp

# Add AdAway hosts to hosts-tmp
echo 'Adding `AdAway`s hosts to hosts-tmp...'
curl https://raw.githubusercontent.com/AdAway/adaway.github.io/master/hosts.txt >> ad_away_hosts.txt
sed -e 's/127.0.0.1/0.0.0.0/g' ./ad_away_hosts.txt >> hosts-tmp
rm -rf ad_away_hosts.txt

# Removing duplicates
echo 'Removing duplicates...'
uniq hosts-tmp > hosts.tmp
rm -rf hosts-tmp

# Preparing hosts file
echo 'Preparing hosts file...'
rm -rf hosts
touch hosts
cat hosts.orig >> hosts
echo "\n\n" >> hosts
cat hosts.tmp >> hosts
rm -rf hosts.tmp

# Microsoft Git Bash fix
sed -e 's/\\n\\n/\n/g' ./hosts >> hosts-dos
rm -rf hosts
mv hosts-dos hosts

echo 'Done!'
echo "\n"

echo 'You can link generated hosts to "/etc/hosts"'
echo 'with command shown below'
echo "\n"
echo 'sudo ln -f hosts /etc/hosts'
