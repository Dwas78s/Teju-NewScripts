#!/bin/bash
SOURCEDIRECTORY=/tmp/applogs
if [ -d $SOURCEDIRECTORY ]
then
echo "Sourcedirectory exists:$SOURCEDIRECTORY"
else
echo "Sourcedirectory doesnot exists:$SOURCEDIRECTORY"
exit 1
fi
