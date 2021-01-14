function git_status
    git status --show-stash -b -uall --renames
end

function git_reflog_expire
    git reflog expire --expire=now --all
end

function git_repack_ad
    git repack -ad
end

function git_prune
    git prune
end

function git_fetch
    git fetch --all --prune
end

function git_rebase
    git_fetch
    git pull --rebase
    git submodule update --init --recursive
end
