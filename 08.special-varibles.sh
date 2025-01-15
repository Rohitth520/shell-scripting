#!/bin/bash

echo "ALL Variables passed: $@"
echo "Number of variable: $#"
echo "Script name: $0"

echo "Present working directory: $PWD"
echo "Home directory of current user: $HOME"
echo "Which user is running the script: $USER"
echo "Process id of current script: $$"
sleep 60 &
echo "Process id of last command in the background: $!"

