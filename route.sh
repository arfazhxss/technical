#!/bin/bash

git add . && \
git add -u && \
git commit -m $'Routine Commit:'"[$(date)]"$'\n@arfazhxss' && \
git push origin HEAD
