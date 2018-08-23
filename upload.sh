#!/bin/bash

COMMENT=" updated "



if [ $# -gt 0 ] ; then
    COMMENT=$1
else
    echo "USAGE: ./upload.sh <comment>"
    exit
fi

a=$((`awk -F= '{print $2}' version.py  | sed "s/\s*'//g" | awk -F. '{print $NF}'` + 1))
VERSION=`awk -F= '{print $2}' version.py  | sed "s/\s*'//g" | awk -F. 'BEGIN{OFS="."}{print $1,$2}'`.$a


echo __version__ = \'$VERSION\'
#exit

echo __version__ = \'$VERSION\' > version.py

../gitscripts_/gitscript.sh $COMMENT
git tag $VERSION -m $COMMENT
git push --tags
python setup.py sdist upload -r test
python setup.py sdist upload -r pypi