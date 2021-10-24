#!/bin/bash
set -e

git tag -l | while read -r tag; do
  COMMIT_HASH=$(git rev-list -1 $tag)
  COMMIT_MSG=$(git tag -l --format='%(contents)' $tag | head -n1)
  GIT_COMMITTER_DATE="$(git show $COMMIT_HASH --format=%aD | head -1)"
  git tag -s -a -f $tag -m"$COMMIT_MSG" $COMMIT_HASH
done

git push --tags --force --no-verify
