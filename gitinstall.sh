#!/bin/bash
USERID=$(id -u)

if [ $USERID -ne 0]
then
    echo "Error :: User must have sudo access"
    exit 1
fi

sudo dnf list installed git

if [ $? -ne 0 ]
then
    sudo dnf install git
    if [ $? -eq 0 ]
    then
        echo "installed successfully!!"
        exit 1
    else
        echo "installation failed!!"
        exit 1
    fi
else
    echo "git is alreday installed"
fi
    