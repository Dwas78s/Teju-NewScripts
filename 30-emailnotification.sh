#!/bin/bash
DISKUSAGE=$(df -hT|grep xfs)
DISKTHRESHOLD=10
MESSAGE=""

while IFS= read -r line
do
USAGE=$(echo $line |awk -F " " '{print$6F}'|cut -d "%" -f1)
FOLDER=$(echo $line|awk -F " " '{print$NF}')
if [ $USAGE -ge $USAGE ]
then
#echo "$FOLDER is morethan $DISKTHRESHOLD, current usage : $USAGE"
MESSAGE+="$FOLDER is morethan $DISKTHRESHOLD, current usage : $USAGE \n"
fi
done <<<$DISKUSAGE
echo -e "Message: $MESSAGE"
echo "$MESSAGE"|mail -s "Diskusagereport" "tejaswinichalla05@gmail.com"
