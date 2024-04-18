#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0| cut -d "." -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log
echo "$SCRIPTNAME"
echo "$LOGFILE"
VALIDATE()
{
    if [ $1 -ne 0 ]
    then 
echo "$2 ....FAILURE"
else 
echo "$2 ....SUCCESS"
fi
}
if [ $USERID -ne 0 ]
then
echo "Please login with the root user"
exit 1
else
echo "You are a root user and going to next steps"
fi
dnf install mysql -y 
VALIDATE $? "Installing MYSQL"
dnf installl git -y
VALIDATE $? "Installing GIT"


