###################################
######### fish-user Paths #########
###################################

## Variables
set -gx fish_greeting ""

# Fish paths
set -gx FISH_PATH "$HOME/.config/fish"
set -gx FISH_FUNCTIONS_PATH "$FISH_PATH/functions"

set -gx BAT_THEME "ansi" # bat/batcat theme
set -gx MOZ_USE_OMTC 1 # Firefox for Linux patch
set -gx NFANCURVE_PATH "$HOME/nfancurve" # nFanCurve Linux patch
set -gx GPG_TTY (tty) # GnuPG auto-load
set -gx HOMEBREW_NO_ANALYTICS 1 # Homebrew disable telemetry

# Mosh / OS SSH fix
set -gx LANG "en_US.UTF-8"
set -gx LANGUAGE "en_US.UTF-8"
set -gx LC_ALL "en_US.UTF-8"

# Rust / Cargo
set -gx CARGO_INSTALL_ROOT "$HOME/.cargo"
set -gx CARGO_HOME "$HOME/.cargo"

# npm
set -gx NPM_CONFIG_PREFIX "$HOME/.npm-global"

# Go
set -gx GOPATH "$HOME/go"

# Android SDK
set -gx ANDROID_HOME "$HOME/Library/Android/sdk"
set -gx ANDROID_SDK_ROOT "$HOME/Library/Android/sdk"
set -gx ANDROID_AVD_HOME "$HOME/.android/avd"

# ********************************
# ********* PATH of env **********
# ********************************

# Homebrew
set -gx PATH "/usr/local/sbin" $PATH
set -gx PATH "/opt/homebrew/bin" $PATH
set -gx PATH "/opt/homebrew/sbin" $PATH

set -gx PATH "$HOME/.cargo/bin" $PATH # Rust
set -gx PATH "$HOME/go/bin" $PATH # Go

# npm / fnm
set -gx PATH "$NPM_CONFIG_PREFIX/bin" $PATH
set -gx PATH "$HOME/.fnm" $PATH

# Android SDK
set -gx PATH "/opt/homebrew/opt/openjdk/bin" $PATH
set -gx PATH "$ANDROID_HOME/emulator" $PATH
set -gx PATH "$ANDROID_HOME/tools" $PATH
set -gx PATH "$ANDROID_HOME/tools/bin" $PATH
set -gx PATH "$ANDROID_HOME/platform-tools" $PATH
set -gx PATH "$JAVA_HOME/bin" $PATH # Java

# Load some functions
source $FISH_FUNCTIONS_PATH/git_utils.fish
source $FISH_FUNCTIONS_PATH/brew_utils.fish

# ********************************
# ********* shell flags **********
# ********************************

set -gx LDFLAGS "-L/usr/local/opt/openssl@1.1/lib"
set -gx CPPFLAGS "-I/usr/local/opt/openssl@1.1/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl@1.1/lib/pkgconfig"


########## init scripts ###########

# Load aliases
source $FISH_PATH/alias.fish

# **** starship ****
if type -q starship
    starship init fish | source
end

