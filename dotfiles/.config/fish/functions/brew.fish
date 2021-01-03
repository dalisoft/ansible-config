function update_modules
    npm update -g
    cd ~/Desktop
    git_rb
end

function brew_cleanup --argument hard
  brew cleanup
  brew cleanup -s
  brew cleanup --prune 0
  brew cleanup -s
end

function brew_upgrade
  brew update --verbose
  brew upgrade --formula --verbose
  brew upgrade --cask --greedy --verbose
end

function update_all
  brew_upgrade
  brew_cleanup
  update_modules
end
