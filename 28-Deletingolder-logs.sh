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
echo "Files to deleted:$FILES"
while IFS= read -r line

do
echo "Deleting File: $line"

done <<<$FILES

