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
