#!/bin/bash
SOURCEDIRECTORY=/tmp/app-logs
if [ -d $SOURCEDIRECTORY ]
then
echo "Sourcedirectory doesnot exists:$SOURCEDIRECTORY"
exit1
fi
