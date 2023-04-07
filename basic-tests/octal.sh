#!/bin/bash


clear && printf '\e[3J'

echo "Please enter a number to convert"
read num

decimal='^[0-9]*(\.[0-9]+)?$'

if ! [[ $num =~ $decimal ]] ; then
   echo "error: input is not a decimal" >&2; exit 1
fi

echo "obase=2;$num" | bc #binary
echo "obase=8;$num" | bc #octal
echo "obase=16;$num" | bc #hexidecimal
