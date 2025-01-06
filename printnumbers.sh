#!/bin/bash
echo "enter the number"

read NUMBER

if [ $NUMBER -lt 2 ]
then
   echo "$NUMBER is not a prime number"
   exit
fi

N=`expr $NUMBER / 2`

echo $N
for i in $N
do

if [ `expr $NUMBER % $i` -eq 0 ]
then
 echo "$NUMBER is not a prime number"
 exit
fi
done

echo "$NUMBER is prime number"
