#!bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
echo "You are not a root user, so I am going to exit here"
exit 1
else
echo "You are a root user, so I am going to proceed with next steps"
fi
dnf install mysql -y
if [ $? -ne 0 ]
then 
echo "MYSQL package installation....Failure"
else
echo "MYSQL package installation....Success"
fi