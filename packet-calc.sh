#!/bin/bash


clear && printf '\e[3J'

echo "Please type interface name ie. eth0 :" 
read interfc
echo "Please set time :" 
read tim_val

echo "interface, packet-sent, packet-recieved, time " >> log.csv
while true;
    do
        connection="ifconfig"
        Pack_Received=`$connnection $interfc | grep RX | head -1` 
        EmptyReceived=`echo $Pack_Received | cut -d ' ' -f3`
        Pack_Sent=`$connection $interfc | grep TX  | head -1` 
        EmptySent=`echo $Pack_Sent | cut -d ' ' -f3`
        echo " $interfc, $EmptySent, $EmptyReceived, `date`" >> log.csv;
    sleep $tim_val;
done

