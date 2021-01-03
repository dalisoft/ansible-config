###################################
######### fish-user Paths #########
###################################

## Variables
set -gx FISH_PATH "$HOME/.config/fish"
set -gx FISH_FUNCTIONS_PATH "$FISH_PATH/functions"
set -gx FISH_PATHS_PATH "$FISH_PATH/paths"

# Load some functions
source $FISH_FUNCTIONS_PATH/git.fish
source $FISH_FUNCTIONS_PATH/brew.fish

# Load paths
source $FISH_PATHS_PATH/autoload.fish

# Load aliases
source $FISH_PATH/alias.fish

########## init scripts ###########

# **** starship ****
if type -q starship
    starship init fish | source
end
