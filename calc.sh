#!/bin/bash
#task2 calculator

clear && printf '\e[3J'

echo "Select the operation"
echo "  1)Addition"
echo "  2)Subtraction"
echo "  3)Division"
echo "  4)Mod" 
echo "  5)Multiply" 
read option

echo "Enter your first number and second number with space in between"
read first second


number='^[0-9]+$'

if ! [[ $first =~ $number ]] ; then
   echo "error: first input is not a number" >&2; exit 1
fi

if ! [[ $second =~ $number ]] ; then
   echo "error: second input is not a number" >&2; exit 1
fi

case $option in
  1) echo `expr $first + $second`;;
  2) echo `expr $first - $second`;;
  3) echo `expr $first / $second`;;
  4) echo `expr $first % $second`;;
  5) echo `expr $first "*" $second`;;
  *) echo "invalid option";;
esac
