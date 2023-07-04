#!/bin/sh

files=$(git diff --name-only --staged --diff-filter=ACMR | grep -E '\.(ts|tsx)$' | sed 's| |\\ |g')

echo "$files" | xargs ./node_modules/.bin/eslint
[ $? -ne 0 ] && exit 1 


files=$(git diff --name-only --staged --diff-filter=ACMR | sed 's| |\\ |g')
[ -z "$files" ] && exit 0
echo "$files" | xargs ./node_modules/.bin/prettier --ignore-unknown --check
