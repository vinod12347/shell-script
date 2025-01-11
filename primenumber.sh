#!/bin/bash
echo "enter the number"

read NUMBER
i=2

if [ $NUMBER -lt 2 ]
then
  echo "number is not a prmie"
  exit
fi

N=$(($NUMBER / 2 ))
echo $N

while [ $i -lt $N ]
do
   if [ `expr $NUMBER % $i` -eq 0 ]
   then
      echo "$NUMBER is not a prmime number"
      exit
    fi
    i=`expr $i + 1`
done
echo "$NUMBER is prime"

