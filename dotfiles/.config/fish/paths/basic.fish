# Fish basics
set -gx fish_greeting ""
set -gx fish_user_paths "$HOME/.cargo/bin" $fish_user_paths
set -gx fish_user_paths "$HOME/go/bin" $fish_user_paths
set -gx fish_user_paths "$HOME/.npm-global/bin" $fish_user_paths
set -gx fish_user_paths "$HOME/.fnm" $fish_user_paths
set -gx fish_user_paths "/usr/local/bin" $fish_user_paths
set -gx fish_user_paths "/usr/local/sbin" $fish_user_paths
set -gx fish_user_paths "/usr/local/opt/openjdk/bin" $fish_user_paths
set -gx fish_user_paths "/usr/local/opt/openssl@1.1/bin" $fish_user_paths

# **** bat/batcat theme ****
set -gx BAT_THEME "ansi"

# **** Mozilla ****
set -gx MOZ_USE_OMTC 1

# **** nFanCurve ****
set -gx NFANCURVE_PATH "$HOME/nfancurve"

# **** GnuPG ****
set -gx GPG_TTY (tty)
