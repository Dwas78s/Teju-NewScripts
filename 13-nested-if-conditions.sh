#!/bin/bash
Age=$1
if [ $Age -lt 10 ]
then 
echo "You are a children"
else if [ $Age -gt 10 && -lt 30 ]
then 
echo "You are younger"
else
echo " you are elder"
fi
