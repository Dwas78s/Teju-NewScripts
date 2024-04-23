#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 |cut -d "." -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

#Functions
VALIDATE()
{
    if [ $1 -ne 0 ]
    then
    echo -e "$2 ....$R Failure $N"
    else 
    echo -e "$2 ....$G SUCCESS $N"
    fi
}

#checking root user or not

if [ $USERID -ne 0 ]
then
echo -e "$R Please run the script with super user $N"
exit 1
else
echo -e "$Y Running the script with root user $N"
fi

dnf module disable nodejs -y &>>LOGFILE
VALIDATE $? "Disabling Node js"

dnf module enable nodejs:20 -y &>>LOGFILE
VALIDATE $? "Enabling Node js"

dnf install nodejs -y &>>LOGFILE
VALIDATE $? "Installing Node js"

#setting up idempotency here

id expense &>>LOGFILE
if [ $? -ne 0 ]
then
useradd expense &>>LOGFILE
VALIDATE $? "creating expense user"
else
echo -e "Expense user already created...$Y Skipping $N"

#setting up idempotency here -p if exists it will skip else it will create

mkdir -p /app &>>LOGFILE
VALIDATE $? "creating app directory"

curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip &>>LOGFILE
VALIDATE $? "Downloading backend code"

cd /app &>>LOGFILE
VALIDATE $? "Going to app ditectory"

rm -rf /app/* &>>LOGFILE #removes unzip files if exists
unzip /tmp/backend.zip &>>LOGFILE
VALIDATE $? "Unzipping backend code"

npm install &>>LOGFILE
VALIDATE $? "Installing nodejs dependencies"

cp /home/ec2-user/Teju-NewScripts/backend.service /etc/systemd/system/backend.service &>>LOGFILE
VALIDATE $? "copied backend service"

systemctl daemon-reload &>>LOGFILE
VALIDATE $? "daemon-reload"

systemctl start backend &>>LOGFILE
VALIDATE $? "starting backend"

systemctl enable backend &>>LOGFILE
VALIDATE $? "enabling backend"

dnf install mysql -y &>>LOGFILE
VALIDATE $? "installing mysql client"

mysql -h <MYSQL-SERVER-IPADDRESS> -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>LOGFILE
VALIDATE $? "Loading schema"

systemctl restart backend &>>LOGFILE
VALIDATE $? "Restarting backend"
















