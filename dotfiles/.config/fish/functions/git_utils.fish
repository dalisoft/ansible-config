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

function gitp_branch
    set branch (git symbolic-ref refs/remotes/origin/HEAD | sed "s@^refs/remotes/origin/@@");
    git branch --merged $branch | grep -v "^[ *]*$branch" | xargs git branch -d
end


function gitf
    git fetch --all --prune
end

function gitsi
    git submodule update --init --recursive --remote --rebase
end

function gitsu
    gitsi
    git submodule foreach --recursive '\
    branch=$(git symbolic-ref refs/remotes/origin/HEAD | sed "s@^refs/remotes/origin/@@"); \
    git fetch --all --prune; \
    git checkout ${branch}; \
    git reset origin/${branch} --soft;\
    ';
end

function git_rb
    gitf
    git pull --rebase
    gitsu
end
