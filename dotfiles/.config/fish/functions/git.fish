function gitstat
    git status --show-stash -b -uall --renames
end

function gitre
    git reflog expire --expire=now --all
end

function gitra
    git repack -ad
end

function gitp
    git prune
end

function gitf
    git fetch --all --prune
end

function git_rb
    gitf
    git pull --rebase
    git submodule update --init --recursive
end
