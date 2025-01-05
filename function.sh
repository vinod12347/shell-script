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

dnf list installed mysql-community-server
VALIDATE $? "mysql server "

sudo dnf install mysql-server

VALIDATE $? "mysql installation"




