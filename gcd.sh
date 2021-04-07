#!/bin/bash
#task1 finding gcd

echo "Enter first number and second number with space:"

read first second


assign="$first"

number='^[0-9]+$'

if ! [[ $first =~ $number ]] ; then
   echo "error: first input is not a number" >&2; exit 1
fi

if ! [[ $second =~ $number ]] ; then
   echo "error: second input is not a number" >&2; exit 1
fi

clear && printf '\e[3J'

if [ "$second" -lt "$assign" ] ; 
then
assign=$second
fi 

while [ "$assign" -ne 0 ]
do
f_gcd=$(expr "$first" % "$assign")
s_gcd=$(expr "$second" % "$assign")

if [ "$f_gcd" -eq 0 -a "$s_gcd" -eq 0 ] ; 
then

echo "gcd of $first and $second is $assign"
break
fi
assign=$(expr "$assign" -1)

done