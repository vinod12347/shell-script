#!/bin/bash
USERID=$(id -u)

LOG_FOLDER="/var/log/shellscript-log"
TIME_STAMP=$(echo date +%Y-%m-%d_%H:%M:%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

FILENAME="$LOG_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log"

echo "$FILENAME"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
    echo "$R Error::$N  $2" &>>FILENAME
    exit
    else
    echo "$G Success::$N  $2" &>>FILENAME
    fi
}

if [$# -eq 0 ]
then
    echo "please pass the packages"
    echo "Usage $0 package1 package2"
fi

if [ $USERID -ne 0 ]
    then 
         echo "permission denied user must be super user"
         exit 1
fi

for package in $@
do

dnf list installed $package &>>FILENAME # check package is alreday installed or not

if [ $? -ne 0 ]
then
  dnf install $package -y # install the package here
  VALIDATE $? "$package installing"
else
    echo "$Y $package alreday installed" &>>FILENAME
fi
done

