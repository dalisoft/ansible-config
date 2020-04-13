###################################
######### fish-user Paths #########
###################################

set -g fish_user_paths "/usr/local/opt/openssl@1.1/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/anaconda3/bin" $fish_user_paths

###################################
######### env parameters  #########
###################################

# **** Android SDK ****
set -gx ANDROID_HOME "$HOME/Library/Android/sdk"

# **** conda ****
set -gx PREFIX /usr/local/anaconda3

# ********************************
# ********* openssl env **********
# ********************************

set -gx LDFLAGS "-L/usr/local/opt/openssl@1.1/lib"
set -gx CPPFLAGS "-I/usr/local/opt/openssl@1.1/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl@1.1/lib/pkgconfig"

# ********************************
# ********** path env ************
# ********************************

# **** Android SDK ****
set -gx PATH "$ANDROID_HOME/emulator" $PATH
set -gx PATH "$ANDROID_HOME/tools" $PATH
set -gx PATH "$ANDROID_HOME/tools/bin" $PATH
set -gx PATH "ANDROID_HOME/platform-tools" $PATH

# **** Conda ****
set -gx PATH "$PREFIX/bin" $PATH

###################################
############# aliases #############
###################################

# **** fnm alias ****
# node.js version manager
alias load_fnm "fnm env --shell=fish --multi | source"

# **** git clean alias ****
alias git_clean="git reflog expire --expire=now --all && git repack -ad && git prune"

# **** python3 ****
alias python=/usr/local/bin/python3

# **** Virtual ENV alias ****
alias venv "source $HOME/env/bin/activate.fish" # Activate V-Env by request

# **** conda init ****
alias conda_init "$PREFIX/bin/conda \"shell.fish\" \"hook\" $argv | source"

###################################
########## init scripts ###########
###################################

# **** starship ****
starship init fish | source
