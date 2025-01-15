#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="e\[33m"

VALIDATE(){


    if [ $1 -ne 0 ]
    then 
        echo -e "$2 ..... $R Failure"
        exit 1
    else
        echo -e "$2..... $G Success"
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

    echo -e "Mysql is already ...... $Y Installed"
fi

dnf list installed git

if [ $? -ne 0 ]
then  #not installed so install now
    dnf install git -y
    VALIDATE $? "Installing Git"
else

    echo -e "git is already ...... $Y Installed"
fi

