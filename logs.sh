#!/bin/bash

LOG_FOLDER="/var/log/shellscript-log"
TIME_STAMP=$(date +%Y-%m-%d:%H:%M:%S)
LOG_FIE=$(echo $0 | cut -d "." -f1)
LOG_FILE_NAME="$LOG_FOLDER/$LOG_FIE-$TIME_STAMP.log"

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"

VALIDATE(){
    echo "$1 $2"
    if [ $? -ne 0 ]
    then
        echo "$2 $R -Failure!!"
        exit 1
    else
        echo "$2 $G -Success!!"
    fi
}
echo "scripted started executing at :$TIME_STAMP" &>>$LOG_FILE_NAME
dnf list installed mysql-community-server &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then #not installed
    dnf install mysql-server -y &>>$LOG_FILE_NAME
    VALIDATE $? "installing mysql server"   
else
echo -e "Mysql server alreday $Y installed!!"
fi

dnf list installed git &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then #not installed case
    dnf install git -y &>>$LOG_FILE_NAME
    VALIDATE $? "installing git" 
else
echo -e "Git alreday $Y installed"
fi 


