#!/bin/bash
SOURCEDIRECTORY=/tmp/app-logs
if [ -d $SOURCEDIRECTORY ]
then
echo "Sourcedirectory exists:$SOURCEDIRECTORY"
else
echo "Sourcedirectory exists:$SOURCEDIRECTORY"
exit 1
fi
