#!/bin/sh
# Relink old commits user.name && user.email to news
# Warning!! This will destroy your team git commit history
## Steps below:
## step1: Clone your repo at new dir
## step2: Play the script in dir root
## step3: Execute the script
git filter-branch --env-filter '

OLD_EMAIL="oldmail@example.com"
NEW_EMAIL="newmail@example.com"
NEW_NAME="New Name"

if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$NEW_NAME"
    export GIT_COMMITTER_EMAIL="$NEW_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$NEW_NAME"
    export GIT_AUTHOR_EMAIL="$NEW_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags

# Make it effective on remote repository
git push --force --tags origin 'refs/heads/*'
