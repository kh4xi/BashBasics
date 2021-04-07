#!/bin/bash
#task4 file_length_comparator

clear && printf '\e[3J'


echo "Please type location of the first file" 
read first

echo "Please type location of the second file" 
read second

#checking if file exists
if [ ! -f $first ]; then
    echo "First file not found!"
fi

if [ ! -f $second ]; then
    echo "Second file not found!"
fi

#setting the size
size_first=$(wc -l <$first)
size_second=$(wc -l <$second) 

#checks if file empty
if [[ "$size_first" = 0 ]]; then
    echo "$first file is empty"
    exit
fi

if [[ "$size_second" = 0 ]]; then
    echo "$second file is empty"
    exit 
fi

#compare file size 
if [[ "$size_first" == "$size_second" ]] ; then
    echo "$first file and $second file is equal"
    exit 2;
elif [[ "$size_first" -gt "$size_second" ]] ; then
   echo "$first file is greater than $second file"
    exit 3;
else 
    echo "$second file is greater than $first file"
    exit 4;
fi

