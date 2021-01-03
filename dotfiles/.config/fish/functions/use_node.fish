function use_node --argument ver
    fnm env --shell=fish | source
    fnm use $ver
end