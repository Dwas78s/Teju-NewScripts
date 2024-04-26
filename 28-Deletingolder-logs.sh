#!/bin/bash
SOURCEDIRECTORY=/tmp/app-logs
if [ -d $SOURCEDIRECTORY ]
then
echo "Sourcedirectory exists:$SOURCEDIRECTORY"
else
echo "Sourcedirectory doesnot exists:$SOURCEDIRECTORY"
exit 1
fi
FILES=$(find $SOURCEDIRECTORY "*.log" -mtime +14)
echo "Files to deleted: $FILES"

