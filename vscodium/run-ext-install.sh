#/!/bin/bash

cat vscodium.extensions | xargs -L1 /Applications/VSCodium.app/Contents/Resources/app/bin/code --install-extension
