#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have Sudo access to run the script"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then  #not installed so install now
    dnf install mysql -y
    if [ $? -ne 0 ]
    then 
        echo "Installing MySql ..... Failure"
        exit 1
    else
        echo "Installing MySql ..... Success"
    fi
else

    echo "Mysql is already ...... Installed"
fi

dnf list installed git

if [ $? -ne 0 ]
then  #not installed so install now
    dnf install git -y
    if [ $? -ne 0 ]
    then 
        echo "Installing git ..... Failure"
        exit 1
    else
        echo "Installing git ..... Success"
    fi
else

    echo "git is already ...... Installed"
fi

