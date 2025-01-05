#!/bin/bash
USERID=$(id -u)

echo "userid is :: $USERID"

if [ $USERID -ne 0]
 then
    echo "ERROR :: user mush be root user"
    exit 1
fi

dnf dnf list installed mysql-community-server
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

sudo systemctl stop mysqld

if [ $? -ne 0 ]
then
  echo "not able to stop the server"
  exit 1
fi 

sudo systemctl set-environment MYSQLD_OPTS="--skip-grant-tables"

if [ $? -ne 0 ]
then
  echo "Setting of MYSQLD_OPTS failed"
  exit 1
fi 

sudo systemctl start mysqld

if [ $? -ne 0 ]
then
  echo "restarting mysqld service failed!!"
  exit 1
fi 

mysql -u root
UPDATE mysql.user SET authentication_string = PASSWORD('root123')
     WHERE User = 'root' AND Host = 'localhost';
FLUSH PRIVILEGES;
quit;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root123';


sudo systemctl stop mysqld

sudo systemctl unset-environment MYSQLD_OPTS


sudo systemctl start mysqld


