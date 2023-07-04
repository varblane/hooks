#!/bin/sh

deleted=$(git diff --name-only --staged --diff-filter=D | wc -l)

if [ $deleted -gt 1000 ]; then
    git reset --hard
    exit 1
fi
