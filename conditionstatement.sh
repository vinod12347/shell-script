#!/bin/bash
NUMBER=$1
# -gt ,-lt, -eq,-ge,-le
if [ $NUMBER -gt 100 ]
then
    echo "number is greater then 100"
else [ $NUMBER -eq 100]
    echo "number is equl"
fi
