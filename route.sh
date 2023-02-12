#!/bin/bash

git add . && \
git add -u && \
git commit -m $'Routine Commit:\n'"[$(date)]"$'\n@arfazhxss' && \
git push origin HEAD
