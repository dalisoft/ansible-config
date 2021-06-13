# Install Chocolatey
Write-Output "Installing chocolatey..."
$testchoco = powershell choco -v
if (-not($testchoco)) {
	Write-Output "Seems Chocolatey is not installed, installing now"
	Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}
else {
	Write-Output "Chocolatey Version $testchoco is already installed"
}

# First disable prompt
Write-Output "Disabling prompt for every installation..."
choco feature enable -n=allowGlobalConfirmation

Write-Output "Installing apps..."
choco install pyqt5 heroku-cli kdiff3            # Additional tools
choco install 7zip                               # Essential desktop tools
choco install anaconda3 rust-analyzer            # Additional PL tools
choco install obs vlc potplayer etcher           # Media
choco install qbittorrent                        # Download tools
choco install anydesk clockify ganttproject      # Management
choco install office365business notion           # Productivity
choco install googlechrome firefox               # Browsers
choco install 1password telegram slack           # GUI Essential Apps
choco install octave gitkraken datagrip          # Development tools
choco install postman altair-graphql             # HTTP / GraphQL clients
choco install insomnia-rest-api-client           # HTTP client
choco install sublimetext3 vscode                # Editors
choco install webstorm androidstudio             # IDE
choco install watchman                           # Dependencies

choco install docker-desktop virtualbox          # Hyper
choco install adoptopenjdk15 cyberduck           # Additional tools

choco install steam                              # Gaming stores

choco install warp nextdns                       # VPNgot fixed
choco install samsung-nvme-driver samsung-magician # Samsung Drivers / Tools (last should be installed manually)

Write-Output "Done!"

Write-Output "Installing npm packages..."
npm i -g node-gyp http-server npm-check-updates typesync nodemon flamebearer 0x cordova bs-platform esy

Write-Output "Done!"

# Write-Output "Installing pip packages..."
# pip install virtualenv jupyterlab notebook labelme psrecord

# Write-Output "Done!"
