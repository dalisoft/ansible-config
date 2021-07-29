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

function git_correct_tags
  git tag -l | while read -l tag
    set TAG_COMMIT_HASH (git rev-list -1 $tag)
    set TAG_COMMIT_RAW_MSG (git tag -l --format='%(contents)' $tag | head -n1)
    set TAG_COMMIT_SIGN (echo $TAG_COMMIT_RAW_MSG | grep -o -- 'Signed-off-by(.*)')
    if count $TAG_COMMIT_SIGN >> /dev/null
      set TAG_COMMIT_MSG (echo $TAG_COMMIT_RAW_MSG | sed "s/$TAG_COMMIT_SIGN//g")
    else
      set TAG_COMMIT_MSG $TAG_COMMIT_RAW_MSG
    end

    set SEARCH_COMMIT_HASH (git log --fixed-strings --grep "$TAG_COMMIT_MSG" --no-decorate --format=%H --max-count=1)
    set SEARCH_COMMIT_MSG (git show $SEARCH_COMMIT_HASH -q --format=%B)
    set GIT_COMMITTER_DATE "(git show $SEARCH_COMMIT_HASH --format=%aD | head -1)"

    if begin count $SEARCH_COMMIT_HASH >> /dev/null; and test "$TAG_COMMIT_HASH" != "$SEARCH_COMMIT_HASH"; end
      git tag -s -a -f $tag -m"$SEARCH_COMMIT_MSG" $SEARCH_COMMIT_HASH
      git push origin refs/tags/$tag --force --no-verify
    end
  end
end

function git_remap_tag --argument commit_hash tag
  set COMMIT_MSG (git show -s --format=%B $commit_hash)
  set GIT_COMMITTER_DATE "(git show $commit_hash --format=%aD | head -1)"
  git tag -s -a -f $tag -m"$COMMIT_MSG" $commit_hash
  git push origin refs/tags/$tag --force --no-verify
end

alias git_rebase='git rebase -S --committer-date-is-author-date'
alias gitsuf='git submodule update --init --recursive --remote --force --checkout'
