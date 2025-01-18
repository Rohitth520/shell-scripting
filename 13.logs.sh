#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOG_FOLDER="/var/log/shellscript.logs"
LOG_FILE=$(echo $O | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOG_FOLDER-$LOF_FILE-$TIMESTAMP"


VALIDATE() {
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 ........$R failure $N" 
    exit 1
    else
        echo -e "$2 .........$G success $N"
    fi

}
echo "script executed at: $TIMESTAMP" &>>$LOG_FILE_NAME

if [ $USERID -ne 0 ]
then 
    echo "ERROR::You must have Sudo access to execute the Script"
fi

dnf list installed mysql &>>$LOG_FILE_NAME


if [ $? -ne 0 ]
then
    dnf install mysql -y &>>$LOG_FILE_NAME
    VALIDATE $? "Installing mysql"
else
    echo -e "mysql already.......$Y  installed $N" 
fi


dnf list installed git &>>$LOG_FILE_NAME
if [ $? -ne 0 ]
then
    dnf install git -y &>>$LOG_FILE_NAME
    VALIDATE $? "Installing git"
else 
    echo -e "git already .........$Y installed $N"
fi