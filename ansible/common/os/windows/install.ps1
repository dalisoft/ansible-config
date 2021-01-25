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
choco install firacode starship bat ripgrep           # Terminal essentials
choco install nano neovim                             # Terminal editors
choco install git git-lfs git-cola                    # Git
choco install rsync rclone                            # Sync and Clone
choco install curl wget                               # Fetching
choco install gpg4win-vanilla unzip                   # Utilities
choco install podman-machine podman-cli               # Podman
choco install ffmpeg ghostscript                      # Addinitional utilities
choco install nodejs python3 php                      # Languages essentials
choco install rust cmake golang deno                  # Languages essentials #2
choco install yarn composer                           # Package managers
choco install gradle llvm                             # Additions to PL
choco install heroku-cli                              # Terminal additions
choco install linkshellextension                      # Essential utilities

Write-Output "Done!"
