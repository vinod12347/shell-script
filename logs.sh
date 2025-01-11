#!/bin/bash

LOG_FOLDER="/var/log/shellscript-log"
TIME_STAMP=$(date +%Y-%m-%d:%H:%M:%S)
LOG_FIE=$(echo $0 | cut -d "." -f1)
LOG_FILE_NAME="$LOG_FOLDER/$LOG_FIE-$TIME_STAMP.log"

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo -e "$2 ... $R -Failure!! $N"
        exit 1
    else
        echo -e "$2 ... $G -Success!! $N"
    fi
}
echo "scripted started executing at :$TIME_STAMP" &>>$LOG_FILE_NAME
dnf list installed mysql-community-server &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then #not installed
    dnf install mysql-server -y &>>$LOG_FILE_NAME
    VALIDATE $? "installing mysql server"   
else
echo -e "Mysql server alreday $Y installed!! $N"
fi

dnf list installed git &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then #not installed case
    dnf install git -y &>>$LOG_FILE_NAME
    VALIDATE $? "installing git" 
else
echo -e "Git alreday $Y installed $N"
fi 


