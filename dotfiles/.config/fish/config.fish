###################################
######### fish-user Paths #########
###################################

set -gx fish_user_paths "/usr/local/bin" $fish_user_paths
set -gx fish_user_paths "$HOME/.cargo/bin" $fish_user_paths
set -gx fish_user_paths "$HOME/go/bin" $fish_user_paths
set -gx fish_user_paths "$HOME/.npm-global/bin" $fish_user_paths
set -gx fish_user_paths "/usr/local/opt/openssl@1.1/bin" $fish_user_paths

###################################
######### env parameters  #########
###################################

switch (uname)
    case Darwin
        alias cat=bat

    case Linux
        set -gx MOZ_USE_OMTC 1

        if type -q batcat
            alias cat=batcat
        end
        if type -q bat
            alias cat=bat
        end

end

# **** Mosh ****
set -gx LANG "en_US.UTF-8"
set -gx LANGUAGE "en_US.UTF-8"
set -gx LC_ALL "en_US.UTF-8"

# **** Brew ****
set -gx HOMEBREW_NO_ANALYTICS 1

# **** Rust (Cargo) ****
set -gx CARGO_INSTALL_ROOT "$HOME/.cargo"
set -gx CARGO_HOME "$HOME/.cargo"

# **** GO ****
set -gx GOPATH "$HOME/go"

# **** Android SDK ****
set -gx ANDROID_HOME "$HOME/Library/Android/sdk"

# **** NPM ****
set -gx NPM_CONFIG_PREFIX "$HOME/.npm-global"

# **** BAT ****
set -gx BAT_THEME "Monokai Extended Bright"

# **** nFanCurve ****
set -gx NFANCURVE_PATH "$HOME/nfancurve"

# ********************************
# ********** path env ************
# ********************************

# **** Load local binaries ****
set -gx PATH "/usr/local/bin" $PATH

# **** Rust (Cargo) ****
set -gx PATH "$HOME/.cargo/bin" $PATH

# **** GO ****
set -gx PATH "$HOME/go/bin" $PATH

# **** NPM ****
set -gx PATH "$NPM_CONFIG_PREFIX/bin" $PATH

# **** Android SDK ****
set -gx PATH "$ANDROID_HOME/emulator" $PATH
set -gx PATH "$ANDROID_HOME/tools" $PATH
set -gx PATH "$ANDROID_HOME/tools/bin" $PATH
set -gx PATH "$ANDROID_HOME/platform-tools" $PATH

# **** Homebrew - Linux ****
set -gx PATH "$HOMEBREW_PREFIX/bin" $PATH
set -gx PATH "$HOMEBREW_PREFIX/sbin" $PATH

# **** LSP ****
set -gx PATH "$HOME/lsp/bin" $PATH

# ********************************
# ********* openssl env **********
# ********************************

set -gx LDFLAGS "-L/usr/local/opt/openssl@1.1/lib"
set -gx CPPFLAGS "-I/usr/local/opt/openssl@1.1/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl@1.1/lib/pkgconfig"

# ********************************
# ********* openblas env *********
# ********************************

set -gx LDFLAGS "-L/usr/local/opt/openblas/lib"
set -gx CPPFLAGS "-I/usr/local/opt/openblas/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/openblas/lib/pkgconfig"

###################################
############# aliases #############
###################################

# **** Terminal stuffs ****
if type -q exa
    alias ls=exa
    alias ll="ls -hlaS --extended --git --time-style=long-iso"
end
if type -q rg
    alias grep=rg
end

# **** git clean alias ****
alias git_status="git status --show-stash -b -uall --renames"
alias git_reflog_expire="git reflog expire --expire=now --all"
alias git_repack_ad="git repack -ad"
alias git_prune="git prune"
alias git_fetch="git fetch --all --prune"
alias git_rb="git_fetch && git pull --rebase && git submodule update --init --recursive"

# **** ssh generate ****
alias sshg="ssh-keygen -o -a 100 -t ed25519 -C \"dalisoft@mail.ru\""

# **** python3 ****
alias python=python3

# **** Virtual ENV alias ****
alias venv "source $HOME/env/bin/activate.fish" # Activate V-Env by request

# **** fnm ****
alias load_fnm "fnm env --shell=fish --multi | source"

# **** docker vm ****
alias run_vm "docker run -ti --rm --net=bridge --name=vm_terminal"
alias run_vm_tmp "docker run -ti --rm --net=bridge --name=tmp_vm_terminal"

# **** test internet speed ****
alias inet_speed_test "curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"

# **** manager updates and cleanups ****
alias update_all "brew update --verbose && brew upgrade --verbose && brew upgrade --cask --greedy --verbose && brew cleanup && brew cleanup -s && update_modules"
alias update_modules "npm update -g && cd ~/Desktop && git_rb"
alias brew_cleanup "brew cleanup --prune 0 && brew cleanup -s"

###################################
########## init scripts ###########
###################################

# **** starship ****
if type -q starship
    starship init fish | source
end
