#!/bin/bash
SOURCEDIRECTORY=/tmp/app-logs
if [ -d $SOURCEDIRECTORY -ne 0 ]
then
echo "Sourcedirectory doesnot exists:$SOURCEDIRECTORY"
exit1
fi
