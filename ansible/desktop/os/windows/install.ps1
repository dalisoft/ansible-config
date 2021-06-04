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

Write-Output "Installing packages..."
choco install pyqt heroku-cli kdiff3             # Additional tools
choco install 7zip                               # Essential desktop tools
choco install anaconda3 rust-analyzer            # Additional PL tools
choco install obs vlc potplayer etcher           # Media
choco install freedownloadmanager qbittorrent    # Download tools
choco install anydesk clockify ganttproject      # Management
choco install office365business notion           # Productivity
choco install googlechrome firefox               # Browsers
choco install 1password telegram slack           # GUI Essential Apps
choco install octave gitkraken datagrip          # Development tools
choco install postman altair-graphql             # HTTP / GraphQL clients
choco install insomnia insomnia-designer         # HTTP / GraphQL clients
choco install sublime-text vscode                # Editors
choco install webstorm android-studio            # IDE
choco install watchman                           # Dependencies

choco install anacondajdk15                        # Additional tools
choco install vmware-workstation-player virtualbox # VM

choco install steam                              # Gaming stores

choco install warp                               # VPN
choco install nextdns --ignore-checksum          # Disable checksum until it got fixed
choco install samsung-nvme-driver samsung-magician # Samsung Drivers / Tools (last should be installed manually)

Write-Output "Done!"
