#!/bin/bash
while read  ipadd
do
#echo $ipadd
export ipadd
./writeall.sh $ipadd
done < $1
