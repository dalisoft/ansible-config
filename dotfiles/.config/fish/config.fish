###################################
######### fish-user Paths #########
###################################

## Variables
set -gx FISH_PATH "$HOME/.config/fish"
set -gx FISH_PATHS_PATH "$FISH_PATH/paths"

cat $FISH_PATHS_PATH/autoload.fish | source
cat $FISH_PATH/alias.fish | source

########## init scripts ###########

# **** starship ****
if type -q starship
    starship init fish | source
end
