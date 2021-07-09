function gitp_branch
    set branch (git symbolic-ref refs/remotes/origin/HEAD | sed "s@^refs/remotes/origin/@@");
    git branch --merged $branch | grep -v "^[ *]*$branch" | xargs git branch -d
end

function gitsu
    git si
    git submodule foreach --recursive '\
    branch=$(git symbolic-ref refs/remotes/origin/HEAD | sed "s@^refs/remotes/origin/@@"); \
    git fetch --all --prune; \
    git checkout ${branch}; \
    git reset origin/${branch} --soft;\
    ';
end

function git_rb
  git f
  git pull --rebase
  gitsu
end
