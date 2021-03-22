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
choco install pyqt heroku-cli kdiff3          # Additional tools
choco install 7zip                            # Essential desktop tools
choco install anaconda3 rust-analyzer         # Additional PL tools
choco install obs vlc potplayer               # Media
choco install freedownloadmanager qbittorrent # Download tools
choco install anydesk                         # Remote management
choco install googlechrome firefox            # Browsers
choco install 1password telegram slack        # GUI Essential Apps
choco install octave gitkraken postman datagrip # Development tools
choco install vscode                          # Editors
choco install android-studio                  # IDE
# choco install libreoffice-fresh               # Office tools

choco install anacondajdk15                   # Additional tools
choco install vmware-workstation-player       # VM

choco install steam epicgameslauncher         # Gaming stores

choco install warp                            # VPN
choco install nextdns --ignore-checksum # Disable checksum until it got fixed
choco install samsung-nvme-driver samsung-magician # Samsung Drivers / Tools (last should be installed manually)

Write-Output "Done!"
