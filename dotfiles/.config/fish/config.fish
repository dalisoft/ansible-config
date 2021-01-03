###################################
######### fish-user Paths #########
###################################

## Variables
set -gx FISH_PATH "$HOME/.config/fish"
set -gx FISH_FUNCTIONS_PATH "$FISH_PATH/functions"
set -gx FISH_PATHS_PATH "$FISH_PATH/paths"

# Load some functions
cat $FISH_FUNCTIONS_PATH/git.fish | source
cat $FISH_FUNCTIONS_PATH/brew.fish | source

# Load paths
cat $FISH_PATHS_PATH/autoload.fish | source

# Load aliases
cat $FISH_PATH/alias.fish | source

########## init scripts ###########

# **** starship ****
if type -q starship
    starship init fish | source
end
