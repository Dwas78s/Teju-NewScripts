#!/bin/bash
SOURCEDIRECTORY=/tmp/app-logs
if [ -d $SOURCEDIRECTORY ]
then
echo "Sourcedirectory exists:$SOURCEDIRECTORY"
else
echo "Sourcedirectory doesnot exists:$SOURCEDIRECTORY"
exit 1
fi
FILES=$(find $SOURCEDIRECTORY -name "*.log" -mtime +14)
echo -e "Files to deleted: \n $FILES"

