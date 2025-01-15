#!/bin/bash

USERID=$(id -u)

VALIDATE(){


    if [ $1 -ne 0 ]
    then 
        echo "$2 ..... Failure"
        exit 1
    else
        echo "$2..... Success"
    fi

}

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have Sudo access to run the script"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then # not installed
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"
else

    echo "Mysql is already ...... Installed"
fi

dnf list installed git

if [ $? -ne 0 ]
then  #not installed so install now
    dnf install git -y
    VALIDATE $? "Installing Git"
else

    echo "git is already ...... Installed"
fi

