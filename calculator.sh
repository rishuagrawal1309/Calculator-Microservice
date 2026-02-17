#!/bin/bash

echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"

echo -n "Enter First Number: "
read a

echo -n "Enter Second Number: "
read b

echo -n "Enter Your Choice: "
read ch

case $ch in
1) res=`expr $a + $b` ;;
 2) res=`expr $a - $b` ;;
 3) res=`expr $a \* $b` ;;
 4) res=`expr $a / $b` ;;
 *) echo "Invalid choice"; exit 1 ;;
esac

echo "Result: $res"
