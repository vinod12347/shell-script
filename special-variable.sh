#!/bin/bash

echo "All variables passed :: $@"
echo "number of variables :: $#"
echo "script name :: $0"
echo "present working directory :: $PWD"
echo "Home directory of :: $HOME"
echo "Which user is running this script :: $USER"
echo "process id of the current script :: $$"
sleep 60 &

echo "processId of the last command in background : $!"

