#!/bin/bash
#auto-git v4.5

echo "Commit Message:"
read cmss

if [[ -z "$cmss" || ${#cmss} -lt 3 ]]; then
  cmss="Routine Commit"
  git add . && \
  git add -u && \
  git commit -m $"$cmss"$'\nby @arfazhxss on '"$(date +'%a %d %b %Y')" && \
  git push origin HEAD
  git log > commit-hist.txt
  rm -rf .DS_Store/
else
  git add . && \
  git add -u && \
  git commit -m $"$cmss"$'\nCommit by @arfazhxss on '"$(date +'%a %d %b %Y')" && \
  git push origin HEAD
  git log > commit-hist.txt
  rm -rf .DS_Store/
fi
