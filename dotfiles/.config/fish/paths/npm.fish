# **** NPM ****
set -gx NPM_CONFIG_PREFIX "$HOME/.npm-global"

set -gx PATH "$NPM_CONFIG_PREFIX/bin" $PATH

# **** LSP ****
set -gx PATH "$HOME/lsp/bin" $PATH
set -gx PATH "$HOME/.npm-global/bin" $PATH
set -gx PATH "$HOME/.fnm" $PATH
