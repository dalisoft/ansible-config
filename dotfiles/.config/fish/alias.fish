# Aliases

# batcat alias
switch (uname)
    case Darwin
        alias cat=bat

    case Linux
        if type -q batcat
            alias cat=batcat
        end
        if type -q bat
            alias cat=bat
        end
end


# **** Terminal stuffs ****
if type -q exa
    alias ls=exa
    alias ll="ls -hlaS --extended --git --time-style=long-iso"
end
if type -q rg
    alias grep=rg
end

# **** python3 ****
alias python=python3
