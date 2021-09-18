# Aliases
switch (uname)
    case Darwin
        set -gx JAVA_HOME (/usr/libexec/java_home)

        alias cat=bat # bat
    case Linux
        # bat
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

alias python=python3
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"

alias lsa='killall ssh-agent; eval (ssh-agent -c)'
alias clean_ds='find ~/Desktop -name .DS_Store -not -path "*/node_modules/*" -delete'
alias get_storage="smartctl -a disk1s2 | rg 'Data Unit|Available|Percentage|Temperature'"
