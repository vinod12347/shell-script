#!/bin/bas
NUMBER1=$1
NUMBER2=$2

TIMESTAMP=$(date)
SUM=$(($NUMBER1 + $NUMBER2))
echo "Time stamp: $TIMESTAMP"
echo "addition of $NUMBER1 and $NUMBER2 is :: $SUM"
