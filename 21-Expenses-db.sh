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
    if [$1 -ne 0 ]
    then
    echo -e "$R $2 ...FAILURE $N"
    else
    echo -e "$G $2 ....SUCCESS $N"
    fi
}

#Checking root user or not

if [ $USERID -ne 0 ]
then
echo "Please run this script with root user"
exit1
else
echo -e " $Y You are a root user... I am proceeding with the next steps $N"
fi

dnf install mysql-server -y
VALIDATE $? "Installing MYSQL Server"

systemctl enable mysqld
VALIDATE $? "Enabling MYSQL Server"

systemctl start mysqld
VALIDATE $? "Starting MYSQL DB Server"

#setting up idempotency because once we reset password again we cant do reset it.

mysql -h 172.31.83.73 -uroot -p$DBPassword -e 'show databases;'
if [ $? eq 0 ]
then
echo -e " $Y Password setup is already done..Skipping $N"
else
mysql_secure_installation --set-root-pass $DBPassword
VALIDATE $? "Setting up  MYSQL password"
fi



