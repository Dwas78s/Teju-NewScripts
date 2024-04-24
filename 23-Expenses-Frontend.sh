#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 |cut -d "." -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE()
{
    if [ $1 -ne 0 ]
    then
    echo "$2 .... Failure"
    else
    echo "$2 .... Sucess"
    fi
}

if [ $USERID -ne 0 ]
then
echo "Run this script with super user"
else
echo "You are a super user"
fi

dnf install nginx -y 
VALIDATE $? "Installing nginx"

systemctl enable nginx
VALIDATE $? "Enabling nginx"

systemctl start nginx
VALIDATE $? "starting nginx"

rm -rf /usr/share/nginx/html/*
VALIDATE $? "removing existing content"

curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip
VALIDATE $? "Downloading front end code"

cd /usr/share/nginx/html
VALIDATE $? "Going to path"

unzip /tmp/frontend.zip
VALIDATE $? "unzipping frontend code"

cp /home/ec2-user/Teju-NewScripts/expense.conf /etc/nginx/default.d/expense.conf
VALIDATE $? "Copied expense.conf"

systemctl restart nginx
VALIDATE $? "restarting nginx"





