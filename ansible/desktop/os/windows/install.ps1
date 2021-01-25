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
choco install pyqt heroku-cli
choco install anaconda3 rust-analyzer
choco install 7zip kdiff3
choco install obs vlc
choco install anydesk
choco install googlechrome firefox
choco install 1password telegram
choco install octave gitkraken postman
choco install sublimetext3 vscode android-studio

choco install anacondajdk8
choco install vmware-workstation-player

Write-Output "Done!"
