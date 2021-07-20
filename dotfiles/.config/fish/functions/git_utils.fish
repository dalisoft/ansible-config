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

function gitf
  git fetch --all --prune
end

function git_prb
  gitf
  git pull --rebase --committer-date-is-author-date
  gitsu
end

function git_sign_tags
  git tag -l | while read -l tag
    set COMMIT_HASH (git rev-list -1 $tag)
    set COMMIT_MSG (git tag -l --format='%(contents)' $tag | head -n1)
    set GIT_COMMITTER_DATE "(git show $COMMIT_HASH --format=%aD | head -1)"
    git tag -s -a -f $tag -m"$COMMIT_MSG" $COMMIT_HASH
  end
  git push --tags --force --no-verify
end

alias git_rebase='git rebase -S --committer-date-is-author-date'
alias gitsuf='git submodule update --init --recursive --remote --force --checkout'
