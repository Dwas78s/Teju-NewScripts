#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
echo "You are not a root or super user: $USERID"
else
echo "You are a root user: $USERID"
fi