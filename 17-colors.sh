#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0| cut -d "." -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


VALIDATE()
{
    if [ $1 -ne 0 ]
    then 
echo -e "$2 ....$R FAILURE $N"
exit 1
else 
echo -e "$2 .... $G SUCCESS $N"
fi
}
if [ $USERID -ne 0 ]
then
echo "Please login with the root user"
exit 1
else
echo "You are a root user and going to next steps"
fi
dnf install mysql -y &>>$LOGFILE
VALIDATE $? "Installing MYSQL"
dnf installl git -y &>>$LOGFILE
VALIDATE $? "Installing GIT"