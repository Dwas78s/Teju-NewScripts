#!/bin/bash
USERID=$(id -u)
VALIDATE()
{
echo "exit status: $1"
echo "what are you doing: $2"
}
if[ $USERID -ne 0]
then
echo "Please login with the root user"
exit 1
else
echo "You are a root user and going to next steps"
fi
dnf install mysql -y 
VALIDATE $? "Installing MYSQL"

