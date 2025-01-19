#!/bin/bash
USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
    echo -e "$R please provide the super user permission $N"
    exit 1
fi

dnf list installed ansible

if [ $? -ne 0 ]
then
   dnf install ansible

   if [ $? -ne 0 ]
   then
        echo -e "$R installation failed $N"
        exit 1
    else
    echo -e "$G Ansible installed successfully $N"
   fi
else
    echo -e "$Y ansible alreday installed $N"
fi

