###################################
######### fish-user Paths #########
###################################

set -gx fish_user_paths "/usr/local/opt/openssl@1.1/bin" $fish_user_paths
set -gx fish_user_paths "$HOME/.npm-global/bin" $fish_user_paths
set -gx fish_user_paths "$HOME/go/bin" $fish_user_paths
set -gx fish_user_paths "$HOME/.cargo/bin" $fish_user_paths
set -gx fish_user_paths "$HOME/lsp/bin" $fish_user_paths
set -gx fish_user_paths "/home/linuxbrew/.linuxbrew/bin" $fish_user_paths
set -gx fish_user_paths "/home/linuxbrew/.linuxbrew/sbin" $fish_user_paths

###################################
######### env parameters  #########
###################################

switch (uname)
  case Darwin
    # set -gx DOCKER_HOST "ssh://root@$REMOTE_MACHINE_IP"
  case Linux
    # echo "Linux"
    set -gx HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew";
    set -gx HOMEBREW_CELLAR "/home/linuxbrew/.linuxbrew/Cellar";
    set -gx HOMEBREW_REPOSITORY "/home/linuxbrew/.linuxbrew/Homebrew";

    set -gx MANPATH "$HOMEBREW_PREFIX/share/man" $MANPATH;
    set -gx INFOPATH "$HOMEBREW_PREFIX/share/info" $INFOPATH

end

# **** Brew ****
set -gx HOMEBREW_NO_ANALYTICS 1

# **** Android SDK ****
set -gx ANDROID_HOME "$HOME/Library/Android/sdk"

# **** NPM ****
set -gx NPM_CONFIG_PREFIX "$HOME/.npm-global"

# **** BAT ****
set -gx BAT_THEME "Monokai Extended Bright"

# **** GO ****
set -gx GOPATH "$HOME/go"

# **** Rust (Cargo) ****
set -gx CARGO_INSTALL_ROOT "$HOME/.cargo"
set -gx CARGO_HOME "$HOME/.cargo"

# **** nFanCurve ****
set -gx NFANCURVE_PATH "$HOME/nfancurve"

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
set -gx PATH "$ANDROID_HOME/platform-tools" $PATH

# **** Homebrew - Linux ****
set -gx PATH "$HOMEBREW_PREFIX/bin" $PATH
set -gx PATH "$HOMEBREW_PREFIX/sbin" $PATH

# **** NPM ****
set -gx PATH "$NPM_CONFIG_PREFIX/bin" $PATH

# **** GO ****
set -gx PATH "$HOME/go/bin" $PATH

# **** Rust (Cargo) ****
set -gx PATH "$HOME/.cargo/bin" $PATH

# **** LSP ****
set -gx PATH "$HOME/lsp/bin" $PATH

###################################
############# aliases #############
###################################

# **** Terminal stuffs ****
alias cat=bat
alias ls=exa
alias grep=rg
alias vim=nvim

# **** git clean alias ****
alias git_reflog_expire="git reflog expire --expire=now --all"
alias git_repack_ad="git repack -ad"
alias git_prune="git prune"

# **** python3 ****
alias python=python3

# **** Virtual ENV alias ****
alias venv "source $HOME/env/bin/activate.fish" # Activate V-Env by request

# **** fnm ****
alias load_fnm "fnm env --shell=fish --multi | source"

# **** test internet speed ****
alias inet_speed_test "curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"

###################################
########## init scripts ###########
###################################

# **** starship ****
starship init fish | source
