#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 |cut -d "." -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
echo "Please enter DB Password"
read DBPassword

#Functions to validate succeess or Failure

VALIDATE()
{
    if [ $1 -ne 0 ]
    then
    echo -e "$R $2 ...FAILURE $N"
    else
    echo -e "$G $2 ....SUCCESS $N"
    fi
}

#Checking script is executing with super user or not
CHECKROOT()
{
if [ $USERID -ne 0 ]
then
echo "Please run this script with root user"
exit 1
else
echo -e " $Y You are a super user... I am proceeding with the next steps $N"
fi
}