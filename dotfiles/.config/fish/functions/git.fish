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

function gitp_branch --argument branch
    git branch --merged $branch | grep -v "^[ *]*$branch|master" | xargs git branch -d
end


function gitf
    git fetch --all --prune
end

function gitsmu
    gitf
    git submodule update --init --recursive --remote --rebase
end

function git_rb
    gitf
    git pull --rebase
    gitsmu
end
