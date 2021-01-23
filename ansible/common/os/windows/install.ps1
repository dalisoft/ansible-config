# Install chocolately
echo "Install chocolately..."
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# First disable prompt
echo "Disabling prompt for every installation..."
choco feature enable -n=allowGlobalConfirmation

echo "Installing packages..."
:repeat
choco install firacode starship || goto :repeat              # Terminal essentials
choco install git wget curl bat cmake || goto :repeat        # Utilities
choco install python3 golang nodejs yarn || goto :repeat     # Languages essentials
choco install rust-analyzer gradle anaconda3 || goto :repeat # Additions to PL
choco install heroku-cli                                     # Terminal additions
choco install linkshellextension || goto :repeat             # Essential utilities
choco install neovim || goto :repeat                         # Editor

echo "Done!"
