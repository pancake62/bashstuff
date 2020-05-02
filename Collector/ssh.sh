#!/bin/bash
while read  ipadd
do
#echo $ipadd
export ipadd
./commands.sh $ipadd
done < $1
