###################################
######### fish-user Paths #########
###################################

set -g fish_user_paths "/usr/local/opt/openssl@1.1/bin" $fish_user_paths
# set -g fish_user_paths "$HOME/go/bin" $fish_user_paths
# set -g fish_user_paths "/usr/local/opt/llvm/bin" $fish_user_paths
# set -g fish_user_paths "/usr/local/Cellar/swift/4.2.1/Swift-4.2.1.xctoolchain/usr/bin" $fish_user_paths

###################################
######### env parameters  #########
###################################

# ********************************
# ********* openssl env **********
# ********************************

set -gx LDFLAGS "-L/usr/local/opt/openssl@1.1/lib"
set -gx CPPFLAGS "-I/usr/local/opt/openssl@1.1/include"
# set -gx LDFLAGS "-L/usr/local/opt/llvm/lib"
# set -gx CPPFLAGS "-I/usr/local/opt/llvm/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl@1.1/lib/pkgconfig"

# ********************************
# ********** path env ************
# ********************************

# **** Swift Toolchain ****
# set -gx TOOLCHAINS "swift"

# **** Global $PATH ****
# set -gx PATH "$GOPATH/bin" $PATH
# set -gx PATH "/usr/local/opt/llvm/bin" $PATH

# **** Go $PATH ****
# set -gx GOPATH "$HOME/go"

# **** Swift $PATH ****
# set -gx PATH "/usr/local/Cellar/swift/4.2.1/Swift-4.2.1.xctoolchain/usr/bin"

# **** Go Envs ****
# set -gx GO111MODULE "auto"

# **** Compression ****
set -gx GZIP 9

###################################
############# aliases #############
###################################

# **** fnm alias ****
# node.js version manager
alias load_fnm "fnm env --shell=fish --multi | source"

# **** git clean alias ****
alias git_clean="git reflog expire --expire=now --all AND git repack -ad AND git prune"

# **** archive alias ****
alias gza="tar cvzf"

# ==============================

# ******************************
# ******** python alias ********
# ******************************
# python 3.8, 3 and 2 (legacy) aliases

# **** python38 ****
alias python38=/usr/local/opt/python@3.8/bin/python3

# **** python3 ****
# (as default)
alias python=/usr/local/bin/python3

# **** python2 ****
# (as legacy)
# for old apps which uses python2
alias python2=/usr/bin/python

# **** Virtual ENV alias ****
alias venv "source $HOME/env/bin/activate.fish" # Activate V-Env by request

###################################
########## init scripts ###########
###################################

# **** starship ****
starship init fish | source
