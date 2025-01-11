#!/bin/bash
read -p "enter the number" NUMBER
SUM=0
while [[ $NUMBER -ge 1 ]] ; do
SUM=`expr $SUM + $NUMBER`
 NUMBER=`expr $NUMBER - 1`
done

echo $SUM