#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"

VALIDATE(){
    echo $1
    if [ $1 -eq 0 ]
    then
        echo -e "$2 $G success"
    else
        echo -e "$2 $R failure!!"
        exit 1
    fi
}

if [ $USERID -ne 0 ]
then
    echo -e "$R user must have sudo access"
    exit 1
fi

dnf list installed mysql-community-server

if [ $? -ne 0 ]
then 
dnf install mysql-server -y
echo $?
if [ $? -ne 0 ]
then
    VALIDATE $? "mysql installation"
else
    VALIDATE $? "mysql installation"
fi
else
    echo -e "Mysql server alreday $Y installed"
fi




