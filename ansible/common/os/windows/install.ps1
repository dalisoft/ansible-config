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
choco install git git-lfs git-cola \                  # Git
			rsync rclone \                                  # Sync and Clone
			curl wget \                                     # Fetching
			gpg4win-vanilla unzip \                         # Utilities
		  podman-machine podman-cli \                     # Podman
		  ffmpeg ghostscript                              # Addinitional utilities
choco install cmake python3 golang nodejs yarn deno   # Languages essentials
choco install rust-analyzer gradle anaconda3          # Additions to PL
choco install heroku-cli                              # Terminal additions
choco install linkshellextension                      # Essential utilities

Write-Output "Done!"
