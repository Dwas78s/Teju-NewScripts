#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(DATE +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 |cut -d "." -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log
R="\e[31m"
Y="\e[32m"
G="\e[33m"
N="\e[0m"

VALIDATE()
{
    if [ $1 -ne 0 ]
    then 
    echo -e "$2 ...$R FAILURE $N"
    else
    echo -e "$2....$G SUCCESS $N"
}

if [ $USERID -ne 0 ]
then
echo " Please run the script with root user"
exit 1
else 
echo -e "You are root User..$G I am going to execute next steps...$N"
fi

for i in $@
do
echo "Packages to install: $i"
dnf list installed $i &>>LOGFILE
if [ $? -eq 0 ]
then
echo -e "$G $i Already package installed $N...$Y Skipping..$N"
else
dnf install $i -y &>>$LOGFILE
VALIDATE $? "INSTALLATION of $i"
fi
done



