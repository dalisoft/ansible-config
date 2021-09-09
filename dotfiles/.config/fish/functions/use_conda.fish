function use_conda
  eval (brew --prefix)/Caskroom/miniforge/base/bin/conda "shell.fish" "hook" $argv | source
end
