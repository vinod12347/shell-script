#!/bin/bash

LOG_FOLDER="/var/log/shellscript-log"
TIME_STAMP=$(date +%Y-%m-%d:%H:%M:%S)
LOG_FIE=$(echo $0 | cut -d "." f1)
LOG_FILE_NAME="$LOG_FOLDER/$LOG_FIE-$TIME_STAMP.log"

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"

VALIDATE(){

    if [ $1 -ne 0 ]
    then
        echo "$2 $R -Failure!!"
        exit 1
    else
        echo "$s $G -Success!!"
}

dnf list installed mysql-community-server &>>LOG_FILE_NAME

if [ $? -ne 0 ]
then
    dnf install mysql-server -y &>>LOG_FILE_NAME

    if [ $? -ne 0 ]
     then
        VALIDATE $? "Mysql server installation" 
    else
     VALIDATE $? "Mysql server installation"
    fi
else
echo -e "Mysql server alreday $Y installed!!"
fi

dnf list installed git &>>LOG_FILE_NAME

if [$? -ne 0 ]
then
    dnf install git &>>LOG_FILE_NAME
    if [ $? -ne 0 ]
    then
    VALIDATE $? "Git installation"
    else
    VALIDATE $? "Git installation failed"
else
echo -e "Git alreday $Y installed"
fi 


