#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 failure"
    else
        echo "$2 success"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "user must have sudo access"
    exit 1
fi

dnf list installed mysql-community-server

if [ $? -ne 0 ]
then 
VALIDATE $? "mysql server alreday installed"
else
sudo dnf install mysql-server -y
if [ $? -ne 0 ]
then
  VALIDATE $? "mysql installation"
else
VALIDATE $? "mysql installation"
fi




