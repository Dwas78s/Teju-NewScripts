#!/bin/bash
SOURCEDIRECTORY=/tmp/app-logs
if [ -d $SOURCEDIRECTORY ]
then
echo "Sourcedirectory doesnot exists:$SOURCEDIRECTORY"
exit 1
else
echo "Sourcedirectory exists:$SOURCEDIRECTORY"
fi
