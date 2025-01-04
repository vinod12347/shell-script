#!/bin/bash
USERID=$(id -u)

echo "userid is :: $USERID"

if [ $USERID -ne 0]
 then
    echo "ERROR :: user mush be root user"
    exit 1
fi

dnf list installed mysql*
if [ $? -ne 0]
 then
 dnf install mysql-server
    if [ $? -ne 0 ]
    then
    echo "Error:: Mysql installation failed"
    exit 1
    else
     echo "Msql installation is success" 
    fi
else
echo "mysql-server alreday installed"
fi
