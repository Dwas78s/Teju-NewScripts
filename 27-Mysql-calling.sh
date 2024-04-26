#!/bin/bash
source ./26-common.sh
CHECKROOT
dnf install mysql-server -y &>>LOGFILE
VALIDATE $? "Installing MYSQL Server"

systemctl enable mysqld &>>LOGFILE
VALIDATE $? "Enabling MYSQL Server"

systemctl start mysqld &>>LOGFILE
VALIDATE $? "Starting MYSQL DB Server"

#setting up idempotency because once we reset password again we cant do reset it.

mysql -h 172.31.24.61 -uroot -p$DBPassword -e 'show databases;' &>>LOGFILE
if [ $? -eq 0 ]
then
echo -e " $Y Password setup is already done..Skipping $N"
else
mysql_secure_installation --set-root-pass $DBPassword &>>LOGFILE
VALIDATE $? "Setting up  MYSQL password"
fi
