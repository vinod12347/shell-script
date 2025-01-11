#!/bin/bash
NUMBER1=$1
NUMBER2=$2
R="\e[31m"
N="\e[0m"

if [ $# -ne 2 ]
then
 echo -e "$R Usage ::$N SwapNumber.sh 10 20"
 exit 1
fi

echo "Before swapping number $NUMBER1 and $NUMBER2"

NUMBER1=$(($NUMBER1 + $NUMBER2))
NUMBER2=$(($NUMBER1 - $NUMBER2))
NUMBER1=$(($NUMBER1 - $NUMBER2))

echo "Aftr swapping number $NUMBER1 and $NUMBER2"

