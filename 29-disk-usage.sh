#!/bin/bash
DISKUSAGE=$(df-hT|grep xfs)
DISKTHRESHOLD=10

while IFS=read -r line
do
USAGE=$(echo $line |awk -F " " '{print$6F}')|cut -d "%" -f1)
FOLDER=$(echo $line|awk -F " " '{print$NF}')
if [ $USAGE -ge $USAGE ]
then
echo "$FOLDER is morethan $DISKTHRESHOLD, current usage : $USAGE"
fi
done <<<$DISKUSAGE