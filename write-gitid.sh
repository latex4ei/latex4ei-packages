#!/bin/sh
# Write git.id File

Os=`uname -s`

if [ "$Os" = "Darwin" ]; then
    DATEBIN=gdate
else
    DATEBIN=date
fi

GITREV=$(git rev-list HEAD --count)
echo "\\def\\GitRevision{$GITREV}"> git.id
git show -s --format=%ci | xargs -I var_d $DATEBIN -d "var_d" +\\def\\GitNiceDate{%-d.\ %B\ %Y\ um\ %H:%M\ Uhr} >> git.id

# Get the repository's remote URL
REPO_URL=$(git remote get-url origin)

# Convert SSH URL to HTTPS URL and append /issues for the issues page
# This also ensures it works for URLs ending with .git and without
ISSUES_URL=$(echo $REPO_URL | sed -e 's/^git@github\.com:/https:\/\/github\.com\//' -e 's/\.git$//' -e 's/$/\/issues/')

echo "\\def\\GitIssuesURL{$ISSUES_URL}" >> git.id